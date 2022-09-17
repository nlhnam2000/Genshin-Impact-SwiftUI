//
//  DetailWeapon.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 16/09/2022.
//

import SwiftUI

struct DetailWeapon: View {
    @Environment(\.presentationMode) var presentationMode
    var weapon: Weapon
    
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
                    // MARK: Weapon summary
                    WeaponSummary(weapon: weapon)
                    
                    // MARK: Weapon's introduction
                    ZStack(alignment: .topLeading) {
                        VStack (alignment: .leading, spacing: 10) {
                            Text("Introduction")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.top)
                                .font(.title)

                            Text("\(weapon.weaponDescription)")
                                .foregroundColor(.white)
                                .padding(.horizontal, 25)
                                .padding(.bottom)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.background2)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .offset(y: -40)
                }
            }
        }
        .background(Color.background)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//struct DetailWeapon_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailWeapon()
//    }
//}
