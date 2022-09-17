//
//  CharacterModel.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 08/07/2022.
//

import Foundation
import SwiftUI

class AppData: ObservableObject {
    @Published var characters: [Character] = []
    @Published var skillTalents: SkillTalent? 
    
//    init() {
//        getAllCharacters()
//    }
    
    func getAllCharacters() {
        guard let url = URL(string: "http://127.0.0.1:3000/characters/") else { fatalError("URL is invalid") }
        
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let characters = try decoder.decode([Character].self, from: data)
                    DispatchQueue.main.async {
                        self?.characters = characters
                        // print(characters)
                    }
                } catch {
                    print("decoding error \(error)")
                }
            }
            else {
                fatalError("No data")
            }
        }
        .resume()
    }
    
    func getSkillTalent(characterName: String) {
        guard let url = URL(string: "http://127.0.0.1:3000/characters/\(characterName)/talents/".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) // prevent the space character
        else { fatalError("URL is invalid") }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { fatalError("No data") }
            
            let skillTalents = try? JSONDecoder().decode(SkillTalent.self, from: data)
            
            DispatchQueue.main.async {
                self?.skillTalents = skillTalents
            }
        }
        .resume()
    }
}

// MARK: - Character
struct Character: Codable, Hashable {
    let name, fullname, title, characterDescription: String
    let rarity, element, weapontype, substat: String
    let gender, body, association, region: String
    let affiliation, birthdaymmdd, birthday, constellation: String
    let cv: Cv
    let costs: Costs
    let images: Images
    let url: URLClass?
    let version: String

    enum CodingKeys: String, CodingKey {
        case name, fullname, title
        case characterDescription = "description"
        case rarity, element, weapontype, substat, gender, body, association, region, affiliation, birthdaymmdd, birthday, constellation, cv, costs, images, url, version
    }
}

// MARK: - Costs
struct Costs: Codable, Hashable {
    let ascend1, ascend2, ascend3, ascend4: [Ascend]
    let ascend5, ascend6: [Ascend]?
    
    
}

// MARK: - Ascend
struct Ascend: Codable, Hashable {
    let name: String?
    let count: Int?
}

// MARK: - Cv
struct Cv: Codable, Hashable {
    let english, chinese, japanese, korean: String
}

// MARK: - Images
struct Images: Codable, Hashable {
    let image, cover1, cover2: String?
    let card: String?
    let portrait, icon, sideicon, hoyolabAvatar: String?
    let nameicon, nameiconcard, namesideicon: String?

    enum CodingKeys: String, CodingKey {
        case image, card, portrait, icon, sideicon, cover1, cover2
        case hoyolabAvatar = "hoyolab-avatar"
        case nameicon, nameiconcard, namesideicon
    }
}

// MARK: - URLClass
struct URLClass: Codable, Hashable {
    let fandom: String?
}

// MARK: - SkillTalent
struct SkillTalent: Codable {
    let combat1, combat2, combat3: SkillCombat
    
    enum CodingKeys: String, CodingKey {
        case combat1, combat2, combat3
    }
    
    struct SkillCombat: Codable {
        let name, info: String
        let description: String?
        
        enum CodingKeys: String, CodingKey {
            case name, info, description
        }
    }
}
