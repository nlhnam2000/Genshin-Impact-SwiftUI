//
//  ElementalBackground.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 06/09/2022.
//

import SwiftUI

struct ElementalBackground: View {
    var character: Character
    var body: some View {
        if (character.element == "Anemo") {
            ZStack {
                Image("anemo_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .frame(width: 150, height: 150, alignment: .topLeading)
            .background(Color.anemoBackground)
        }
        else if (character.element == "Geo") {
            ZStack {
                Image("geo_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .frame(width: 150, height: 150, alignment: .topLeading)
            .background(Color.geoBackground)
        }
        else if (character.element == "Pyro") {
            ZStack {
                Image("pyro_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .frame(width: 150, height: 150, alignment: .topLeading)
            .background(Color.pyroBackground)
        }
        else if (character.element == "Cryo") {
            ZStack {
                Image("cryo_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .frame(width: 150, height: 150, alignment: .topLeading)
            .background(Color.cryoBackground)
        }
        else if (character.element == "Hydro") {
            ZStack {
                Image("hydro_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .frame(width: 150, height: 150, alignment: .topLeading)
            .background(Color.hydroBackground)
        }
        else if (character.element == "Electro") {
            ZStack {
                Image("electro_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            .frame(width: 150, height: 150, alignment: .topLeading)
            .background(Color.electroBackground)
        }
        else {
            ZStack {
                Image("dendro_icon")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
             .frame(width: 150, height: 150, alignment: .topLeading)
            .frame(alignment: .topLeading)
            .background(Color.dendroBackground)
        }
    }
    
}

struct ElementalBackgroundCover: View {
    var body: some View {
        ZStack {
            Image("geo_icon")
                .resizable()
                .frame(width: 100, height: 100)
        }
        .frame(width: 200, height: 200, alignment: .center)
        .background(Color.geoBackground)
    }
}



struct ElementalBackground_Previews: PreviewProvider {
    static var previews: some View {
        ElementalBackgroundCover()
    }
}
