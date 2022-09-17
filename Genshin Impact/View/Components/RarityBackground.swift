//
//  RarityBackground.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 14/09/2022.
//

import SwiftUI

struct RarityBackground: View {
    var rarity: Int
    var body: some View {
        ZStack {
//            Image("anemo_icon")
//                .resizable()
//                .frame(width: 70, height: 70)
        }
        .frame(width: 150, height: 150, alignment: .topLeading)
        .background(rarity == 5 ? Color.geoBackground : rarity == 4 ? Color.electroBackground :
                        rarity == 3 ? Color.anemoBackground : rarity == 2 ? Color.cryoBackground : Color.pyroBackground)
    }
}

struct RarityBackground_Previews: PreviewProvider {
    static var previews: some View {
        RarityBackground(rarity: 5)
    }
}
