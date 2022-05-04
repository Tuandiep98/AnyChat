//
//  Message_viewmodel.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 28/04/2022.
//

import Foundation

final class MessasgeViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getMessages(){
        isLoading = true
        
        NetworkClient.shared.getMessages{
            [self] result in DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let messages):
                    self.messages = messages
                case .failure(let error):
                    self.messages = MockDataOfMessage.messages
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
    func getMessageStyle(_ current: Int, _ next: Int?,_ previous: Int?) -> MessageStyle {
        let currentMessage = self.messages[current]
        let nextMessage = next != nil ? self.messages[next!] : nil
        let preMessage = previous != nil ? self.messages[previous!] : nil
        
        if preMessage == nil{
            if nextMessage?.author.id == currentMessage.author.id{
                return MessageStyle.BorderTop
            }else{
                return MessageStyle.NotBorder
            }
        }
        
        if nextMessage == nil {
            if preMessage?.author.id == currentMessage.author.id{
                return MessageStyle.BorderBottom
            }else{
                return MessageStyle.NotBorder
            }
        }
        
        if preMessage?.author.id == currentMessage.author.id {
            if currentMessage.author.id == nextMessage?.author.id {
                return MessageStyle.BorderBold
            }else{
                return MessageStyle.BorderBottom
            }
        }else {
            if currentMessage.author.id == nextMessage?.author.id {
                return MessageStyle.BorderTop
            }else{
                return MessageStyle.NotBorder
            }
        }
    }
}
