//
//  DetailArtifact.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 16/09/2022.
//

import SwiftUI

struct DetailArtifact: View {
    @Environment(\.presentationMode) var presentationMode
    var artifact: Artifact
    private let artifactItem: [String: String]
    private let pieces: [String: String]
    
    init(artifact: Artifact) {
        self.artifact = artifact
        self.artifactItem = [
            "flower": artifact.images?.flower ?? "",
            "plume": artifact.images?.plume ?? "",
            "goblet": artifact.images?.goblet ?? "",
            "sands": artifact.images?.sands ?? "",
            "cirlet": artifact.images?.circlet ?? ""
        ]
        self.pieces = [
            "1 piece": artifact.pc1 ?? "",
            "2 pieces": artifact.pc2 ?? "",
            "4 pieces": artifact.pc4 ?? ""
        ]
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color.textPrimary)
                        .padding(10)
                        .font(.system(size: 20).weight(.bold))
                }
                ScrollView() {
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(Array(self.artifactItem.keys), id: \.self) { key in
                                CharacterAvatar(withURL: artifactItem[key] ?? "")
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        ForEach(Array(self.pieces.keys).sorted(by: <), id: \.self) { key in
                            if ((self.pieces[key]?.isEmpty == false)) {
                                Text("\(key): \(self.pieces[key] ?? "")")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.top, 10)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.background)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//struct DetailArtifact_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailArtifact()
//    }
//}
