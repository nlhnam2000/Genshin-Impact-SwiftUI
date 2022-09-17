//
//  CharacterView.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 08/07/2022.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var appData: AppData
    @Binding var searchText: String
    
    private var searchResult: [Character] {
        if searchText.isEmpty {
            return appData.characters
        }
        else {
            return appData.characters.filter({$0.fullname.lowercased().contains(searchText.lowercased())})
        }
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 30) {
                ForEach(searchResult, id: \.self) { character in
                    NavigationLink(destination: DetailCharacter(character: character)) {
                        VStack(alignment: .center, spacing: 10) {
                            ZStack {
                                ElementalBackground(character: character)
                                    .cornerRadius(20)
                                CharacterAvatar(withURL: character.images.icon!)
                                    .frame(width: 150, height: 150)
                            }
                            Text(character.fullname).foregroundColor(.white).bold()
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color.blackBackground)
                        .cornerRadius(20)
                    }
                }
            }.listStyle(PlainListStyle())
        }.background(Color.background)
    }
}

//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView()
//    }
//}
