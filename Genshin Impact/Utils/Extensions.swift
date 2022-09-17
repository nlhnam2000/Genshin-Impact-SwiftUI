//
//  Extension.swift
//  Genshin Impact
//
//  Created by Hoàng  Nam on 08/07/2022.
//

import SwiftUI

extension Color {
    static let background = Color(red: 46.0 / 255, green: 48.0 / 255, blue: 54.0 / 255)
    static let background2 = Color(red: 58.0 / 255, green: 59.0 / 255, blue: 62.0 / 255)
    static let background3 = Color(red: 83.0 / 255, green: 84.0 / 255, blue: 89.0 / 255)
    static let textPrimary = Color(red: 105/255, green: 107/255, blue: 112/255)
    static let blackBackground = Color(red: 30.0 / 255, green: 32.0 / 255, blue: 37.0 / 255)
    
    static let anemoBackground = Color(red: 62.0 / 255, green: 179.0 / 255, blue: 181.0 / 255)
    static let geoBackground = Color(red: 183.0 / 255, green: 145.0 / 255, blue: 69.0 / 255)
    static let pyroBackground = Color(red: 186.0 / 255, green: 91.0 / 255, blue: 63.0 / 255)
    static let hydroBackground = Color(red: 60.0 / 255, green: 112.0 / 255, blue: 183.0 / 255)
    static let electroBackground = Color(red: 150.0 / 255, green: 94.0 / 255, blue: 198.0 / 255)
    static let cryoBackground = Color(red: 109.0 / 255, green: 201.0 / 255, blue: 221.0 / 255)
    static let dendroBackground = Color(red: 115.0 / 255, green: 230.0 / 255, blue: 0 / 255)
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
