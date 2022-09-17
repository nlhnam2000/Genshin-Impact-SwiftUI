//
//  CharacterSummary.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 11/09/2022.
//

import SwiftUI

struct CharacterSummary: View {
    var character: Character
    @State private var backgroundElement: Color = Color.geoBackground
    var body: some View {
        ZStack {
            ZStack {
                Image("\(character.element.lowercased())_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
                ZStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Rarity(rarity: Int(character.rarity) ?? 1)
                            .padding(10)
                        
                        Text("Name: ")
                            .foregroundColor(Color.white)
                        Text("\(character.fullname)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                        
                        Text("Nation: ")
                            .foregroundColor(Color.white)
                            .padding(.top, 2)
                        Text("\(character.region)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                        
                        Text("Weapon: ")
                            .foregroundColor(Color.white)
                            .padding(.top, 2)
                        Text("\(character.weapontype)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                        
                        Text("Constellation: ")
                            .foregroundColor(Color.white)
                            .padding(.top, 2)
                        Text("\(character.constellation)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                    
                        
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 40)
                    .zIndex(10)

                    
                    Spacer()
                    
                    CharacterAvatar(withURL: character.images.cover1 ?? character.images.portrait ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(alignment: .trailing)
                        .offset(x: 100, y: 15)
                        .zIndex(2)
                }
                .zIndex(-1)
            }
            .background(backgroundElement)
            .cornerRadius(25, corners: [.topLeft, .topRight])
            .onAppear() {
                if (character.element == "Geo") {
                    backgroundElement = Color.geoBackground
                }
                else if (character.element == "Pyro") {
                    backgroundElement = Color.pyroBackground
                }
                else if (character.element == "Cryo") {
                    backgroundElement = Color.cryoBackground
                }
                else if (character.element == "Electro") {
                    backgroundElement = Color.electroBackground
                }
                else if (character.element == "Hydro") {
                    backgroundElement = Color.hydroBackground
                }
                else if (character.element == "Anemo") {
                    backgroundElement = Color.anemoBackground
                }
                else {
                    backgroundElement = Color.dendroBackground
                }
            }
        }
    }
}

//struct CharacterSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterSummary()
//    }
//}
