//
//  Stories.swift
//  instOnSwiftUI
//
//  Created by  Denis on 06.04.2021.
//

import SwiftUI

struct Stories: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 20) {
                ForEach(fewStories) {item in
                    OneStory(avatar: item)
                }
            }
            .padding(.vertical, 5)
        }
        .padding(.leading, 20)
    }
}

struct Stories_Previews: PreviewProvider {
    static var previews: some View {
        Stories()
    }
}

struct OneStory: View {
    
    var avatar : storieAvatar
    var body: some View {
        VStack{
            CirclePhoto(avatar: avatar)
            
            Text(avatar.name)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(!avatar.user ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
        }
    }
}

struct storieAvatar : Identifiable{
    var id = UUID()
    var image : String
    var name : String
    var active : Bool
    var user : Bool
}

var fewStories = [
    storieAvatar(image: "ash", name: "Your story", active: false, user: true),
    storieAvatar(image: "bulb", name: "bulbaZavr", active: true, user: false),
    storieAvatar(image: "caterpee", name: "notWidl", active: true, user: false),
    storieAvatar(image: "eve", name: "evengalion", active: true, user: false),
    storieAvatar(image: "round", name: "fine_circle", active: true, user: false)
]


 struct CirclePhoto: View {
    
    var height : CGFloat = 80
    var width : CGFloat = 80
    
    let activeCircle = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9315417409, green: 0.8192614913, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0, blue: 0.6102529764, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing)
    let nonActiveCircle = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing)
    var avatar : storieAvatar
    var body: some View {
        ZStack {
            Image(avatar.image)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 6))
                .overlay(avatar.active ? Circle().stroke(activeCircle, lineWidth: 3) : Circle().stroke(nonActiveCircle, lineWidth: 3))
            ZStack {
                Circle().fill(Color.white).frame(width: 30, height: 30)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .frame(width: 25, height: 25)
                    .background(Color.blue)
                    .cornerRadius(13)
            }
            .offset(x: 25, y: 25)
            .opacity(avatar.user&&(!avatar.active) ? 1 : 0)
        }
        .frame(width: width, height: height)
    }
    
    init(avatar:storieAvatar){
        self.avatar = avatar
    }
    init(avatar:storieAvatar, height: CGFloat, width: CGFloat)
    {
        self.avatar = avatar
        self.height = height
        self.width = width
    }
}

extension CirclePhoto {
    mutating func square() {
        self.height = 40
        self.width = 40
        }
}
