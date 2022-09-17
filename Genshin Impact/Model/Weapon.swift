//
//  Weapon.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 14/09/2022.
//

import Foundation

class WeaponViewModel: ObservableObject {
    @Published var weaponViewModel: [Weapon] = []
    
    func getAllWeapons() {
        guard let url = URL(string: "http://127.0.0.1:3000/weapons") else { fatalError("URL is invalid") }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { fatalError("No data") }
            
            do {
                let weaponData = try JSONDecoder().decode([Weapon].self, from: data)
                DispatchQueue.main.async {
                    self?.weaponViewModel = weaponData
                    // print(weaponData)
                }
            } catch {
                print("Error \(error)")
            }
        }.resume()
    }
}

struct Weapon: Codable, Hashable {
    let name, weaponDescription, weapontype, rarity: String
    let baseatk: Int
    let substat, subvalue, effectname, effect: String
    let r1, r2, r3, r4, r5: [String]?
    let weaponmaterialtype: String
    let costs: Costs
    let images: WeaponImage
    let url: URLClass?
    let version: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case weaponDescription = "description"
        case weapontype, rarity, baseatk, substat, subvalue, effectname, effect
        case r1, r2, r3, r4, r5, weaponmaterialtype, costs, images, url, version
    }
}

struct WeaponImage: Codable, Hashable {
    let image, icon, awakenicon, nameicon, namegacha, nameawakenicon: String?
}
