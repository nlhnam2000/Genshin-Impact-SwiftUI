//
//  WeaponView.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 14/09/2022.
//

import SwiftUI

struct WeaponView: View {
    @ObservedObject var vm: WeaponViewModel
    @Binding var searchText: String
    
    private var searchResult: [Weapon] {
        if searchText.isEmpty {
            return vm.weaponViewModel
        }
        else {
            return vm.weaponViewModel.filter({$0.name.lowercased().contains(searchText.lowercased())})
        }
    }
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 30) {
                ForEach(searchResult, id: \.self) { weapon in
                    NavigationLink(destination: DetailWeapon(weapon: weapon)) {
                        VStack(alignment: .center, spacing: 10) {
                            ZStack {
                                RarityBackground(rarity: Int(weapon.rarity) ?? 1)
                                CharacterAvatar(withURL: weapon.images.icon ?? "")
                                    .frame(width: 150, height: 150)
                            }
                            Rarity(rarity: Int(weapon.rarity) ?? 1)
                            Text(weapon.name).foregroundColor(.white).bold()
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
            vm.getAllWeapons()
        }
    }
}

//struct WeaponView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeaponView()
//    }
//}
