//
//  NavigationBottom.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 09/09/2022.
//

import SwiftUI

struct NavigationBottom: View {
    @Binding var selected: String
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeIn(duration: 0.5)) {
                    selected = "Home"
                }
            } label: {
                Image(systemName: "house")
                    .font(.system(size: 25))
                    .foregroundColor(selected == "Home" ? .white : Color.textPrimary)
                    .padding(.vertical, 15)
                    .padding(.leading)
            }

            Spacer()
            Button {
                withAnimation(.easeIn(duration: 0.5)) {
                    selected = "Character"
                }
            } label: {
                Image(systemName: "person.crop.square")
                    .font(.system(size: 25))
                    .foregroundColor(selected == "Character" ? .white : Color.textPrimary)
                    .padding(.vertical, 15)
            }

            Spacer()
            Button {
                withAnimation(.easeIn(duration: 0.5)) {
                    selected = "Map"
                }
            } label: {
                Image(systemName: "map")
                    .font(.system(size: 25))
                    .foregroundColor(selected == "Map" ? .white : Color.textPrimary)
                    .padding(.vertical, 15)
                    .padding(.trailing)
            }

        }
        .background(Color.blackBackground)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

//struct NavigationBottom_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBottom()
//    }
//}
