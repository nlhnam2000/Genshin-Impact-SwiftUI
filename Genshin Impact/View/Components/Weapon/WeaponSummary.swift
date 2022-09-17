//
//  WeaponSummary.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 16/09/2022.
//

import SwiftUI

struct WeaponSummary: View {
    var weapon: Weapon
    var body: some View {
        ZStack {
            ZStack {
                ZStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Rarity(rarity: Int(weapon.rarity) ?? 1)
                            .padding(10)
                        
                        Text("Name: ")
                            .foregroundColor(Color.white)
                        Text("\(weapon.name)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                        
                        Text("Weapon type: ")
                            .foregroundColor(Color.white)
                            .padding(.top, 2)
                        Text("\(weapon.weapontype)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                        
                        Text("Substat: ")
                            .foregroundColor(Color.white)
                            .padding(.top, 2)
                        Text("\(weapon.substat)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                        
                        Text("Material type: ")
                            .foregroundColor(Color.white)
                            .padding(.top, 2)
                        Text("\(weapon.weaponmaterialtype)")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: 10, y: 3)
                    
                        
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 40)
                    .zIndex(10)

                    
                    Spacer()
                    
                    CharacterAvatar(withURL: weapon.images.icon ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(alignment: .trailing)
                        .offset(x: 100, y: 15)
                        .zIndex(2)
                }
                .zIndex(-1)
            }
            .background(Color.blackBackground)
            .cornerRadius(25, corners: [.topLeft, .topRight])
        }
    }
}

//struct WeaponSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        WeaponSummary()
//    }
//}
