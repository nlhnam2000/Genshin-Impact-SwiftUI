//
//  CharacterAvatar.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 05/09/2022.
//

import SwiftUI
import Combine

struct CharacterAvatar: View {
    @ObservedObject var imageLoader: ImageLoader
    init(withURL: String) {
        imageLoader = ImageLoader(urlString: withURL)
    }
    
    func imageFromData(_ data:Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }

    var body: some View {
        VStack {
            Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
                .resizable()
//                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CharacterAvatar_Previews: PreviewProvider {
    static var previews: some View {
        CharacterAvatar(withURL: "https://upload-os-bbs.mihoyo.com/game_record/genshin/character_icon/UI_AvatarIcon_Hutao.png")
    }
}
 
