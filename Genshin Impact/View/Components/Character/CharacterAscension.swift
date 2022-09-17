//
//  CharacterAscension.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 12/09/2022.
//

import SwiftUI

struct CharacterAscension: View {
    var character: Character
    @Binding var currentAscension: Double
    @StateObject var materialViewModel = MaterialViewModel()
    
    var body: some View {
        ZStack {
            if (Int(currentAscension) == 1) {
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    ForEach(materialViewModel.materials, id: \.self) { item in
                        VStack(alignment: .center, spacing: 10) {
                            CharacterAvatar(withURL: item.images.fandom)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                            Text("\(item.count)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                }
                .onAppear() {
                    materialViewModel.getMaterial(name: character.name, ascendLevel: Int(currentAscension))
                }
            }
            else if (Int(currentAscension) == 2) {
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    ForEach(materialViewModel.materials, id: \.self) { item in
                        VStack(alignment: .center, spacing: 10) {
                            CharacterAvatar(withURL: item.images.fandom)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                            Text("\(item.count)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                }
                .onAppear() {
                    materialViewModel.getMaterial(name: character.name, ascendLevel: Int(currentAscension))
                }
            }
            else if (Int(currentAscension) == 3) {
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    ForEach(materialViewModel.materials, id: \.self) { item in
                        VStack(alignment: .center, spacing: 10) {
                            CharacterAvatar(withURL: item.images.fandom)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                            Text("\(item.count)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                }
                .onAppear() {
                    materialViewModel.getMaterial(name: character.name, ascendLevel: Int(currentAscension))
                }
            }
            else if (Int(currentAscension) == 4) {
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    ForEach(materialViewModel.materials, id: \.self) { item in
                        VStack(alignment: .center, spacing: 10) {
                            CharacterAvatar(withURL: item.images.fandom)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                            Text("\(item.count)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                }
                .onAppear() {
                    materialViewModel.getMaterial(name: character.name, ascendLevel: Int(currentAscension))
                }
            }
            else if (Int(currentAscension) == 5) {
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    ForEach(materialViewModel.materials, id: \.self) { item in
                        VStack(alignment: .center, spacing: 10) {
                            CharacterAvatar(withURL: item.images.fandom)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                            Text("\(item.count)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                }
                .onAppear() {
                    materialViewModel.getMaterial(name: character.name, ascendLevel: Int(currentAscension))
                }
            }
            else if (Int(currentAscension) == 6) {
                HStack(alignment: .center, spacing: 10) {
                    Spacer()
                    ForEach(materialViewModel.materials, id: \.self) { item in
                        VStack(alignment: .center, spacing: 10) {
                            CharacterAvatar(withURL: item.images.fandom)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                            Text("\(item.count)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer()
                }
                .onAppear() {
                    materialViewModel.getMaterial(name: character.name, ascendLevel: Int(currentAscension))
                }
            }
        }
    }
}

//struct CharacterAscension_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterAscension(currentAscension: .constant(1.0))
//    }
//}
