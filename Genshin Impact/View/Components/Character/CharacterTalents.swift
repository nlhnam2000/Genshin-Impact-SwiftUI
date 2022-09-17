//
//  CharacterTalents.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 12/09/2022.
//

import SwiftUI

struct CharacterTalents: View {
    @ObservedObject var appData: AppData
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack (alignment: .leading, spacing: 10) {
                Text("\(appData.skillTalents?.combat1.name ?? "Normal Attack")")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.top)
                    .font(.title)

                Text("\(appData.skillTalents?.combat1.info ?? "Loading ...")")
                    .foregroundColor(.white)
                    .padding(.horizontal, 25)
                    .padding(.bottom)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
        .background(Color.background3)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .offset(y: -60)
        .shadow(color: .black, radius: 10, x: 0, y: 5)

        
        ZStack(alignment: .topLeading) {
            VStack (alignment: .leading, spacing: 10) {
                Text("\(appData.skillTalents?.combat2.name ?? "Normal Attack")")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.top)
                    .font(.title)

                Text("\(appData.skillTalents?.combat2.info ?? "Loading ...")")
                    .foregroundColor(.white)
                    .padding(.horizontal, 25)
                    .padding(.bottom)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
        .background(Color.background3)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .offset(y: -80)
        .shadow(color: .black, radius: 10, x: 0, y: 5)

        
        ZStack(alignment: .topLeading) {
            VStack (alignment: .leading, spacing: 10) {
                Text("\(appData.skillTalents?.combat3.name ?? "Normal Attack")")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.top)
                    .font(.title)

                Text("\(appData.skillTalents?.combat3.info ?? "Loading ...")")
                    .foregroundColor(.white)
                    .padding(.horizontal, 25)
                    .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
        .background(Color.background3)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .offset(y: -100)
        .shadow(color: .black, radius: 3, x: 0, y: 0)  
    }
}

//struct CharacterTalents_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterTalents()
//    }
//}
