//
//  HomeView.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 08/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var currentSelection: String = "Characters"
    @State private var currentTab: String = "Home"
    @State private var searchText: String = ""
//    @State private var toggleSearchBar: Bool = false
    @StateObject var appData = AppData()
    @StateObject var weaponVM = WeaponViewModel()
    @StateObject var artifactVM = ArtifactViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    NavigationBar(selected: $currentSelection, searchText: $searchText)
                    if (currentSelection == "Characters") {
                        CharacterView(appData: appData, searchText: $searchText)
                    }
                    else if (currentSelection == "Weapons") {
                        WeaponView(vm: weaponVM, searchText: $searchText)
                    }
                    else {
                        ArtifactView(artifactVM: artifactVM, searchText: $searchText)
                    }

//                    Spacer()
//                    Spacer()
                    // NavigationBottom(selected: $currentTab)
                }
            }
            .background(Color.background)
            .onAppear() {
                appData.getAllCharacters()
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
        
    }
}
