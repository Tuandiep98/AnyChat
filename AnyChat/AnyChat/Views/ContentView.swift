//
//  ContentView.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 13/04/2022.
//

import SwiftUI
import PopupView

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center){
            DailyActivationView()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct HomeScreen: View {
    @State var showingPopup = false
    
    var body: some View {
        VStack(alignment: .leading){
            Button(action: {
                self.showingPopup = !self.showingPopup
            }){
                AppBarView()
            }
            
//            HorizonalMostActivityTagList()
            DailyActivationView()
            Spacer()
            ChatView()
        }.popup(isPresented: $showingPopup, type: .toast, position: .bottom, dragToDismiss: true){
            Color.white.frame(height: UIScreen.main.bounds.size.height - 150).cornerRadius(30.0).overlay(
                VStack{
                    Image(systemName: "minus").frame(height: 30)
                    Spacer()
                }
            )
        }
    }
}

struct ChatView: View {
    var body: some View {
        ConversationView()
//        ConversationDetailView()
    }
}
