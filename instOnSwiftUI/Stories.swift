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
    
    let activeCircle = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9315417409, green: 0.8192614913, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 0, blue: 0.6102529764, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing)
    let nonActiveCircle = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing)
    
    var avatar : storieAvatar
    var body: some View {
        VStack{
            ZStack {
                Image(avatar.image)
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                    .overlay(avatar.active ? Circle().stroke(activeCircle, lineWidth: 3) : Circle().stroke(nonActiveCircle, lineWidth: 3))
                    .frame(width: 80, height: 80)
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
                .opacity(avatar.active ? 0 : 1)
            }
            
            Text(avatar.name)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(avatar.active ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
        }
    }
}

struct storieAvatar : Identifiable{
    var id = UUID()
    var image : String
    var name : String
    var active : Bool
}

var fewStories = [
    storieAvatar(image: "ash", name: "Your story", active: false),
    storieAvatar(image: "bulb", name: "bulbaZavr", active: true),
    storieAvatar(image: "caterpee", name: "like_a_worm", active: true),
    storieAvatar(image: "eve", name: "evengalion", active: true),
    storieAvatar(image: "round", name: "fine_circle", active: true)
]


