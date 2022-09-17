//
//  DetailCharacter.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 10/09/2022.
//

import SwiftUI

struct DetailCharacter: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var appData = AppData()
    @State private var ascensionLevel: Double = 1.0
    var character: Character
        
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 0) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color.textPrimary)
                        .padding(10)
                        .font(.system(size: 20).weight(.bold))
                }

                ScrollView(showsIndicators: false) {
                    // MARK: Character summary
                    CharacterSummary(character: character)
                    
                    // MARK: Character's introduction
                    ZStack(alignment: .topLeading) {
                        VStack (alignment: .leading, spacing: 10) {
                            Text("Introduction")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.top)
                                .font(.title)

                            Text("\(character.characterDescription)")
                                .foregroundColor(.white)
                                .padding(.horizontal, 25)
                                .padding(.bottom)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.background2)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .offset(y: -40)
                    
                    // MARK: Character's talents
                    CharacterTalents(appData: appData)
                    
                    // MARK: Character's ascension
                    ZStack(alignment: .topLeading) {
                        VStack (alignment: .leading, spacing: 10) {
                            Text("Ascension \(Int(ascensionLevel))")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.top)
                                .font(.title)
                            
                            CharacterAscension(character: character, currentAscension: $ascensionLevel)

                            Slider(value: $ascensionLevel, in: 1...6, step: 1.0)
                                .accentColor(character.element == "Geo" ? .geoBackground :
                                                character.element == "Anemo" ? .anemoBackground :
                                                character.element == "Pyro" ? .pyroBackground :
                                                character.element == "Cryo" ? .cryoBackground :
                                                character.element == "Hydro" ? .hydroBackground :
                                                character.element == "Electro" ? .electroBackground :.dendroBackground)
                                .padding(20)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    .background(Color.blackBackground)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .offset(y: -120)
                }
                .frame(alignment: .leading)
            }
        }
        .background(Color.background)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear() {
            appData.getSkillTalent(characterName: character.fullname)
        }
    }
}

//struct DetailCharacter_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailCharacter()
//    }
//}
