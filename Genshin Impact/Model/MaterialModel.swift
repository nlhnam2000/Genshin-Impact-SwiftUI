//
//  MaterialModel.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 13/09/2022.
//

import Foundation

class MaterialViewModel: ObservableObject {
    @Published var materials: [Material] = []
    
    func getMaterial(name: String, ascendLevel: Int) {
        guard let url = URL(string: "http://127.0.0.1:3000/characters/\(name)/material?ascend=\(ascendLevel)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else { fatalError("URL is invalid") }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { fatalError("No data") }
            
            do {
                let materialData = try JSONDecoder().decode([Material].self, from: data);
                DispatchQueue.main.async {
                     self?.materials = materialData
//                    print(materialData)
                }
            }
            catch {
                print("error \(error)")
            }
        }
        .resume()
    }
}

struct Material: Codable, Hashable {
    let name, materialDescription: String
    let sortorder: Int
    let rarity: String?
    let category, materialtype: String
    let source: [String]
    let images: MaterialImage
    let url: URLClass
    let version: String
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case materialDescription = "description"
        case sortorder, rarity, category, materialtype, source, images, url, version
        case count
    }
}

struct MaterialImage: Codable, Hashable {
    let redirect, fandom: String
    let nameicon: String
}

