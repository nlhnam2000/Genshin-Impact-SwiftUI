//
//  Artifact.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 15/09/2022.
//

import Foundation

class ArtifactViewModel: ObservableObject {
    @Published var artifacts: [Artifact] = []
    
    func getAllArtifact() {
        guard let url = URL(string: "http://127.0.0.1:3000/artifacts") else { fatalError("URL is invalid") }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { fatalError("No data") }
            
            do {
                let artifactList = try JSONDecoder().decode([Artifact].self, from: data)
                DispatchQueue.main.async {
                    self?.artifacts = artifactList
//                    print(artifactList)
                }
            } catch {
                print("Error \(error)")
            }
        }.resume()
    }
}

struct Artifact: Codable, Hashable {
    let name: String
    let rarity: [String]
    let pc1, pc2, pc4: String?
    let flower, plume, sands, goblet, circlet: ArtifactItem?
    let images: ArtifactImage?
    let url: URLClass?
    let version: String
    
    enum CodingKeys: String, CodingKey {
        case name, rarity
        case pc1 = "1pc"
        case pc2 = "2pc"
        case pc4 = "4pc"
        case flower, plume, sands, goblet, circlet, images, url, version
    }
    
    struct ArtifactItem: Codable, Hashable {
        let name, relictype, description: String
    }
    struct ArtifactImage: Codable, Hashable {
        let flower, plume, sands, goblet, circlet: String?
        let nameflower, nameplume, namesands, namegoblet, namecirclet: String?
    }
}
