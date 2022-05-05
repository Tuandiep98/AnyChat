//
//  DailyActivationView.swift
//  AnyChat
//
//  Created by Tuấn Điệp on 05/05/2022.
//

import SwiftUI

struct DailyActivationView_Previews: PreviewProvider {
    static var previews: some View {
        DailyActivationView()
    }
}

struct DailyActivationView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack {
                ForEach(0...4, id: \.self) { index in
                    ActivePerson()
                }
            }.padding(.leading, 20)
        }.frame(height: 130)
    }
}

struct ActivePerson: View {
    var body: some View {
        HStack(spacing: 0){
            Color.yellow
                .frame(width: 80, height: 110)
                .cornerRadius(8)
                .overlay(
                    VStack(alignment: .center, spacing: 0){
                    Spacer()
                    Image("people")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 1.5)
                                    .padding(-4))
                }
            )
        }
    }
}

struct HorizonalMostActivityTagList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack {
                ForEach(0...4, id: \.self) { index in
                    ActivityTag()
                }
            }.padding(.leading, 20)
        }.frame(height: 130)
    }
}

struct ActivityTag: View {
    var body: some View {
        HStack(spacing: 0){
            Color.yellow
                .frame(width: 80, height: 120)
                .cornerRadius(8)
        }
    }
}
