//
//  ContentView.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 13/04/2022.
//

import SwiftUI

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
    var body: some View {
        VStack(alignment: .leading){
//            HorizonalMostActivityTagList()
            DailyActivationView()
            Spacer()
            ChatView()
        }
    }
}

struct ChatView: View {
    var body: some View {
        ConversationView()
//        ConversationDetailView()
    }
}
