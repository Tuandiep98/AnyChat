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
            Text("Interact with").bold().font(.title)
            HStack(alignment: .center){
                Text("your").bold().font(.title)
                Text("happiness").bold().font(.title).foregroundColor(Color.pink)
            }
            RoundedRectangle(cornerRadius: 30).frame(height: 60).foregroundColor(Color.gray.opacity(0.15)).padding().overlay(HStack(alignment: .center){
                Image(systemName: "magnifyingglass").resizable().scaledToFit().frame(width: 30).foregroundColor(Color.gray).padding()
                Text("Search for partner...").font(.title2).foregroundColor(Color.gray)
                Spacer()
            }.padding())
            HorizonalActivePersonList()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HorizonalActivePersonList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack {
                ForEach(0...4, id: \.self) { index in
                    ActivePerson()
                }
            }
        }.frame(height: 130)
    }
}

struct ActivePerson: View {
    var body: some View {
        VStack{
            Image("people")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.pink, lineWidth: 2).padding(-4))
            Spacer()
            Text("Sophia").bold().font(.title3)
        }.padding()
    }
}
//
//struct HighLightCard: View {
//    var body: some View {
//
//    }
//}
