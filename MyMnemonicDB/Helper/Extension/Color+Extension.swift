//
//  Color+Extension.swift
//  MnemonicDB
//
//  Created by Carki on 2023/03/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    static let tabBarBackgroundColor = Color(hex: "#1D1D1D")
    static let unselectedTabItemColor = Color(hex: "#FAFAFA")
    
    static let placeHolderColor = Color(hex: "#929292")
    
    static let buttonBackgroundColor = Color(hex: "#98E024")
    static let textFieldBackgroundColor = Color(hex: "#2E2E2E")
    
    static let statusFine = Color(hex: "#0AB663")
    static let statusAlert = Color(hex: "#DE2E2E")
    
    static let backgroundColor = Color(hex: "#262626")
    static let labelColor = Color(red: 1, green: 1, blue: 1, opacity: 0.3)
    
    static let popupLabelColor = Color(hex: "#A3A3A5")
    static let dividerColor = Color(hex: "#3E3E3E")
}
