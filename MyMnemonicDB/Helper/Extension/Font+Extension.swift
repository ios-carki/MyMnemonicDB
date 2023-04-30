//
//  Font+Extension.swift
//  MnemonicDB
//
//  Created by Carki on 2023/03/25.
//

import SwiftUI
import UIKit

enum Pretendard {
    case medium
    case bold
    case semi_bold
    
    var value: String {
        switch self {
        case .medium:
            return "Pretendard-Medium"
        case .bold:
            return "Pretendard-Bold"
        case .semi_bold:
            return "Pretendard-SemiBold"
        }
    }
}

extension Font {
    static func medium10() -> Font {
        return .custom(Pretendard.medium.value, size: 10)
    }
    
    static func medium11() -> Font {
        return .custom(Pretendard.medium.value, size: 11)
    }
    
    static func medium12() -> Font {
        return .custom(Pretendard.medium.value, size: 12)
    }
    
    static func medium14() -> Font {
        return .custom(Pretendard.medium.value, size: 14)
    }
    
    static func medium16() -> Font {
        return .custom(Pretendard.medium.value, size: 16)
    }
    
    static func bold14() -> Font {
        return .custom(Pretendard.bold.value, size: 14)
    }
    
    static func bold16() -> Font {
        return .custom(Pretendard.bold.value, size: 16)
    }
    
    static func bold20() -> Font {
        return .custom(Pretendard.bold.value, size: 20)
    }
    
    static func bold24() -> Font {
        return .custom(Pretendard.bold.value, size: 24)
    }
    
    static func bold28() -> Font {
        return .custom(Pretendard.bold.value, size: 28)
    }
    
    static func semiBold12() -> Font {
        return .custom(Pretendard.semi_bold.value, size: 12)
    }
    
    static func semiBold14() -> Font {
        return .custom(Pretendard.semi_bold.value, size: 14)
    }
    
    static func semiBold15() -> Font {
        return .custom(Pretendard.semi_bold.value, size: 15)
    }
    
    static func semiBold16() -> Font {
        return .custom(Pretendard.semi_bold.value, size: 16)
    }
    
    static func semiBold20() -> Font {
        return .custom(Pretendard.semi_bold.value, size: 20)
    }
}

extension UIFont {
    static func medium10() -> UIFont {
        return UIFont(name: Pretendard.medium.value, size: 10)!
    }
    
    static func medium11() -> UIFont {
        return UIFont(name: Pretendard.medium.value, size: 11)!
    }
    
    static func medium12() -> UIFont {
        return UIFont(name: Pretendard.medium.value, size: 12)!
    }
    
    static func medium14() -> UIFont {
        return UIFont(name: Pretendard.medium.value, size: 14)!
    }
    
    static func medium16() -> UIFont {
        return UIFont(name: Pretendard.medium.value, size: 16)!
    }
    
    static func bold14() -> UIFont {
        return UIFont(name: Pretendard.bold.value, size: 14)!
    }
    
    static func bold16() -> UIFont {
        return UIFont(name: Pretendard.bold.value, size: 16)!
    }
    
    static func bold20() -> UIFont {
        return UIFont(name: Pretendard.bold.value, size: 20)!
    }
    
    static func bold24() -> UIFont {
        return UIFont(name: Pretendard.bold.value, size: 24)!
    }
    
    static func bold28() -> UIFont {
        return UIFont(name: Pretendard.bold.value, size: 28)!
    }
    
    static func semiBold12() -> UIFont {
        return UIFont(name: Pretendard.semi_bold.value, size: 12)!
    }
    
    static func semiBold14() -> UIFont {
        return UIFont(name: Pretendard.semi_bold.value, size: 14)!
    }
    
    static func semiBold15() -> UIFont {
        return UIFont(name: Pretendard.semi_bold.value, size: 15)!
    }
    
    static func semiBold16() -> UIFont {
        return UIFont(name: Pretendard.semi_bold.value, size: 16)!
    }
    
    static func semiBold20() -> UIFont {
        return UIFont(name: Pretendard.semi_bold.value, size: 20)!
    }
}
