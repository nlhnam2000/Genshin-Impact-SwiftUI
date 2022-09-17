//
//  ArtifactView.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 15/09/2022.
//

import SwiftUI

struct ArtifactView: View {
    @ObservedObject var artifactVM: ArtifactViewModel
    @Binding var searchText: String
    
    private var searchResult: [Artifact] {
        if searchText.isEmpty {
            return artifactVM.artifacts
        }
        else {
            return artifactVM.artifacts.filter({$0.name.lowercased().contains(searchText.lowercased())})
        }
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 30) {
                ForEach(searchResult, id: \.self) { arti in
                    NavigationLink(destination: DetailArtifact(artifact: arti)) {
                        VStack(alignment: .center, spacing: 10) {
                            ZStack {
                                // RarityBackground(rarity: Int(weapon.rarity) ?? 1)
                                CharacterAvatar(withURL: arti.images?.flower ?? "")
                                    .frame(width: 150, height: 150)
                            }
                            Text(arti.name).foregroundColor(.white).bold()
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(Color.blackBackground)
                        .cornerRadius(20)
                    }
                }
            }.listStyle(PlainListStyle())
        }
        .background(Color.background)
        .onAppear() {
            artifactVM.getAllArtifact()
        }
    }
}

//struct ArtifactView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArtifactView()
//    }
//}
