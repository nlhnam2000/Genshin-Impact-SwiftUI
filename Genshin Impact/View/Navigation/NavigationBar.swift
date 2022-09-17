//
//  NavigationBar.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 08/07/2022.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var selected: String
    @State var toggleSearchBar: Bool = false
    @Binding var searchText: String
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "text.justify")
                        .foregroundColor(Color.textPrimary)
                        .font(.system(size: 22).weight(.bold))
                    Spacer()
                    Button {
                        withAnimation(.easeIn) {
                            toggleSearchBar.toggle()
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.textPrimary)
                            .font(.system(size: 22).weight(.bold))
                    }

                }
                .padding(.bottom, 10)
                
                if toggleSearchBar {
                    ZStack(alignment: .leading) {
                        if searchText.isEmpty {
                            Text("Enter the name ... ")
                                .padding(.horizontal)
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 20).bold())
                                .zIndex(10)
                        }
                        TextField("", text: $searchText)
                            .padding()
                            .background(Color.blackBackground)
                            .font(.system(size: 20).bold())
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .zIndex(1)
                    }
                }
                
                ZStack(alignment: .center) {
                    HStack(alignment: .center) {
                        Divider()
                            .frame(width: (UIScreen.main.bounds.width / 3), height: 50)
                            .background(.white)
                            .blendMode(.overlay)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, alignment: selected == "Characters" ? .leading : selected == "Weapons" ? .center : .trailing)
                    HStack {
                        Button {
                            withAnimation(.easeInOut) { selected = "Characters" }
                        } label: {
                            Text("Characters")
                                .frame(maxWidth: UIScreen.main.bounds.width / 3, alignment: .center)
                                .foregroundColor(selected == "Characters" ? .white : Color.textPrimary)
                                .font(.title3.weight(.bold))
//                                .padding(5)

                        }
//                        .background(selected == "Characters" ? .white : Color.background)
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut) { selected = "Weapons" }
                        } label: {
                            Text("Weapons")
                                .frame(maxWidth: UIScreen.main.bounds.width / 3, alignment: .center)
                                .foregroundColor(selected == "Weapons" ? .white : Color.textPrimary)
                                .font(.title3.weight(.bold))
//                                .padding(5)

                        }
                        
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut) { selected = "Artifacts" }
                        } label: {
                            Text("Artifacts")
                                .frame(maxWidth: UIScreen.main.bounds.width / 3, alignment: .center)
                                .foregroundColor(selected == "Artifacts" ? .white : Color.textPrimary)
                                .font(.title3.weight(.bold))
//                                .padding(5)

                        }
//                        .background(selected == "Artifacts" ? .white : Color.background)


                    }
                    .padding(.horizontal, 10)
                }
                
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .background(Color.background)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(selected: .constant("Characters"), searchText: .constant(""))
    }
}
