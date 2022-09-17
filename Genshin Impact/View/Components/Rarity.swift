//
//  Rarity.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 11/09/2022.
//

import SwiftUI

struct Rarity: View {
    var rarity: Int
    var body: some View {
        HStack {
            ForEach(1...rarity, id: \.self) { r in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct Rarity_Previews: PreviewProvider {
    static var previews: some View {
        Rarity(rarity: 2)
    }
}
