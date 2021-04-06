//
//  ContentView.swift
//  instOnSwiftUI
//
//  Created by  Denis on 06.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Top()
            Stories()
            Spacer()
        }.ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Top: View {
    var body: some View {
        HStack{
            Image("pngegg").resizable().frame(width: 130, height: 80)
                .padding(.leading, 20)
            Spacer()
            Image(systemName: "paperplane")
                .resizable().frame(width: 30, height: 30)
                .rotationEffect(.degrees(10))
                .padding(.trailing, 20)
        }
        .padding(.top, 20)
    }
}
