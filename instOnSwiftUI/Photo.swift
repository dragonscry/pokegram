//
//  Photo.swift
//  instOnSwiftUI
//
//  Created by  Denis on 14.04.2021.
//

import SwiftUI

struct Photo: View {
    var body: some View {
        VStack(alignment: .leading){
            Header()
            Image("bulb_1")
                .resizable().scaledToFit()
            PhotoButtons()
            VStack(alignment: .leading){
                Text("11 likes").font(.system(size: 14, weight: .bold, design: .default))
                    .padding(.bottom,1)
                Text("\(Text("bulbaZavr").bold()) me with my friends flowers")
                    .font(.system(size: 14, design: .default))
            }
            .padding(.top, 5)
            .padding(.horizontal, 10)
        }
    }
}

struct Photo_Previews: PreviewProvider {
    static var previews: some View {
        Photo()
    }
}

struct Header: View {
    var ava = storieAvatar(image: "bulb", name: "bulbaZavr", active: true, user: false)
    var body: some View {
        HStack{
            CirclePhoto(avatar: ava, height: 40, width: 40)
            VStack(alignment: .leading) {
                Text(ava.name).bold()
                Text("Island")
            }
            
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ForEach(0..<3) { item in
                    Circle().fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))).frame(width: 5, height: 5)
                        .padding(.horizontal,-2)
                }
            })
            .padding(.trailing,5)
            
        }
        .padding(.horizontal, 10)
    }
}

struct PhotoButtons: View {
    var body: some View {
        HStack(spacing: 15.0) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "suit.heart")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "message")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
                    .rotation3DEffect(
                        .degrees(180),
                        axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/)
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "paperplane")
                    .foregroundColor(.black)
                    .font(.system(size: 25))
            })
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "bookmark")
                    .resizable().frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
            })
            
        }
        .padding(.top, 5)
        .padding(.horizontal,10)
    }
}
