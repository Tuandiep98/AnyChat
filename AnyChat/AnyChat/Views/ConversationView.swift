//
//  ConversationView.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 05/05/2022.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        ScrollView{
            ForEach(0..<10, id: \.self){
                value in NavigationLink(destination: ConversationDetailView()){
                    ConversationCard()
                }.navigationBarHidden(true).buttonStyle(PlainButtonStyle())
            }.frame(width: .infinity)
                .edgesIgnoringSafeArea(.all)
                .listStyle(GroupedListStyle())
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}

struct ConversationCard: View {
    var body: some View {
        HStack{
            Image("people")
                .resizable()
                .scaledToFit()
                .frame(height: 55)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle()
                            .stroke(Color.blue, lineWidth: 2)
                            .padding(-2))
                .padding(.trailing, 5)
            VStack(alignment: .leading){
                Text("Madison Jior").font(.headline)
                Spacer()
                HStack{
                    Text("What time was our meet").font(.subheadline)
                    Text("-").font(.subheadline)
                    Text("20m").font(.subheadline)
                }
            }.padding(.vertical, 5)
            Spacer()
            Image("people")
                .resizable()
                .scaledToFit()
                .frame(height: 18)
                .clipShape(Circle())
                .shadow(radius: 10)
        }.frame(width: .infinity, height: 60).padding(.horizontal, 20).padding(.vertical, 10)
    }
}
