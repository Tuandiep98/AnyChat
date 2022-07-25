//
//  AppBarView.swift
//  AnyChat
//
//  Created by Janeto on 25/07/2022.
//

import SwiftUI

struct AppBarView: View {
    var body: some View {
        HStack(alignment: .center){
            Image("people")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle()
                            .stroke(Color.white, lineWidth: 1.5)
                            .padding(-10))
            Spacer()
            Text("Chats").font(.headline)
            Spacer()
            Image(systemName: "plus").resizable()
                .scaledToFit()
                .frame(height: 20)
        }.padding()
    }
}

struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView()
    }
}
