//
//  ConversationDetailView.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 05/05/2022.
//

import SwiftUI

struct ConversationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationDetailView()
    }
}

struct ConversationDetailView: View {
    @StateObject private var viewModel = MessasgeViewModel()
    @State var currentUser = MockDataOfAuthor.authors[1]
    
    @State private var username: String = ""
//    @FocusState private var focusedField: Bool = false
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack(spacing: 2){
                    ForEach(0..<viewModel.messages.count, id: \.self){
                        value in if viewModel.messages[value].author.id != currentUser.id {
                            MessageView(viewModel.messages[value], viewModel.getMessageStyle(value, value >= (viewModel.messages.count - 1) ? nil : value+1, value == 0 ? nil : value-1), false)
                        } else {
                            MineMessageView(viewModel.messages[value], viewModel.getMessageStyle(value, value >= (viewModel.messages.count - 1) ? nil : value+1, value == 0 ? nil : value-1), true)
                        }
                    }
                }.onAppear{
                    viewModel.getMessages()
                }
                
                if viewModel.isLoading {
                    Spacer()
                    LoadingView()
                    Spacer()
                }
            }
            .alert(item: $viewModel.alertItem) {
                alertItem in Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            HStack(alignment: .center,spacing: 15){
                Image(systemName: "plus.circle.fill").resizable().scaledToFit().frame(height: 25).foregroundColor(.blue)
                Image(systemName: "camera.fill").resizable().scaledToFit().frame(height: 25).foregroundColor(.blue)
                Image(systemName: "square.fill.on.square.fill").resizable().scaledToFit().frame(height: 25).foregroundColor(.blue)
                Image(systemName: "mic.fill").resizable().scaledToFit().frame(height: 25).foregroundColor(.blue)
                Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)).frame(width: .infinity, height: 45, alignment: .center).cornerRadius(25).overlay(TextField(
                    "Aa",
                    text: $username).disableAutocorrection(true).padding())
                Image(systemName: "hand.thumbsup.fill").resizable().scaledToFit().frame(height: 25).foregroundColor(.blue)
            }.padding(.horizontal, 10).padding(.vertical, 5)
        }
    }
}

struct MineMessageView: View {
    var message: Message
    var showingName = false
    var isCurrentUser = false
    var messageStyle: MessageStyle
    
    var borderTop: CGFloat = 5
    var borderBottom: CGFloat = 5
    var showingAvatar: Bool = false
    
    init(_ message: Message, _ messageStyle: MessageStyle = MessageStyle.NotBorder, _ isCurrentUser: Bool = false,_ showingName: Bool = false){
        self.message = message
        self.isCurrentUser = isCurrentUser
        self.showingName = showingName
        self.messageStyle = messageStyle
        
        switch(messageStyle){
        case .all:
            break;
        case .BorderTop:
            self.borderTop = 20
            self.borderBottom = 2
            break;
        case .BorderBottom:
            self.borderBottom = 20
            self.borderTop = 2
            self.showingName = false
            break;
        case .NotBorder:
            self.borderTop = 20
            self.borderBottom = 20
            self.showingName = false
            break;
        case .BorderBold:
            self.borderTop = 2
            self.borderBottom = 2
            self.showingName = false
        }
        
    }
    
    var body: some View {
        HStack(alignment: .bottom){
            Spacer()
            VStack(alignment: .trailing){
                showingName ? Text(message.author.name).font(.subheadline) : nil
                Text(message.content)
                    .padding(10)
                    .foregroundColor(isCurrentUser ? Color.white : Color.black)
                    .background(RoundedCorners(tl: 20, tr: borderTop, bl: 20, br: borderBottom).fill(Color.blue))
            }
            showingAvatar ? Image("people")
                .resizable()
                .scaledToFit()
                .frame(height: 25)
                .clipShape(Circle())
                .shadow(radius: 10) : nil
        }.padding(.horizontal, 10)
    }
}

struct MessageView: View {
    var message: Message
    var showingName = false
    var isCurrentUser = false
    var messageStyle: MessageStyle
    
    var borderTop: CGFloat = 5
    var borderBottom: CGFloat = 5
    var showingAvatar: Bool = true
    
    init(_ message: Message, _ messageStyle: MessageStyle = MessageStyle.NotBorder, _ isCurrentUser: Bool = false,_ showingName: Bool = false){
        self.message = message
        self.isCurrentUser = isCurrentUser
        self.messageStyle = messageStyle
        
        switch(messageStyle){
        case .all:
            break;
        case .BorderTop:
            self.borderTop = 20
            self.borderBottom = 2
            self.showingAvatar = false
            break;
        case .BorderBottom:
            self.borderBottom = 20
            self.borderTop = 2
            self.showingName = false
            self.showingAvatar = true
            break;
        case .NotBorder:
            self.borderTop = 20
            self.borderBottom = 20
            self.showingAvatar = true
            self.showingName = true
            break;
        case .BorderBold:
            self.borderTop = 2
            self.borderBottom = 2
            self.showingAvatar = false
            self.showingName = false
        }
        
        self.showingName = showingName
    }
    
    var body: some View {
        VStack{
            //            DateView(message.createdTime, previousMessage.createdTime, nextMessage.createdTime) .font(.subheadline)
            HStack(alignment: .bottom){
                showingAvatar ? Image("people")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .clipShape(Circle())
                    .shadow(radius: 10) : nil
                VStack(alignment: .leading){
                    showingName ? Text(message.author.name).font(.subheadline).padding(.top, 10) : nil
                    Text(message.content)
                        .padding(10)
                        .foregroundColor(isCurrentUser ? Color.white : Color.black)
                        .background(RoundedCorners(tl: borderTop, tr: 20, bl: borderBottom, br: 20).fill(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0))))
                }.padding(.leading, showingAvatar ? 0 : 33)
                
                Spacer()
            }
        }.padding(.horizontal, 10)
        
    }
}

struct DateView: View {
    var date: Date
    var preMessageDate: Date
    var nextMessageDate: Date
    
    private var formatter = DateFormatter()
    private var isShow = false
    
    init(_ date: Date, _ preMessageDate: Date,  _ nextMessageDate: Date){
        self.date = date
        self.preMessageDate = preMessageDate
        self.nextMessageDate = nextMessageDate
        
        if(date.time < preMessageDate.time){
            isShow = true
            formatter.dateFormat = "E, dd MMM yyyy HH:mm"
        }else if(date.time >= preMessageDate.time){
            isShow = false
            formatter.dateFormat = "HH:mm"
        }else{
            isShow = true
            formatter.dateFormat = "HH:mm"
        }
    }
    
    var body: some View {
        isShow ? Text("\(date, formatter: formatter)").font(.subheadline) : nil
    }
}
