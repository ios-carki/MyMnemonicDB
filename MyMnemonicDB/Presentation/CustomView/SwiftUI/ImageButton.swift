//
//  ImageButton.swift
//  MnemonicDB
//
//  Created by Carki on 2023/03/25.
//

import SwiftUI

struct ImageButton: View {
    
    var iconImage: String?
    var textLabel: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.textFieldBackgroundColor)
                .frame(height: 66)
                .frame(maxWidth: .infinity)
                .overlay(
                    ZStack {
                        HStack(spacing: 40) {
                            Image(systemName: iconImage ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.orange)
                            
                            Text(textLabel ?? "")
                                .foregroundColor(.orange)
                                .font(.semiBold16())
                        }
                    }
                )
        }
    }
}

extension ImageButton {
    
    func setImage(_ title: String?) -> Self {
        var copy = self
        copy.iconImage = title
        
        return copy
    }
    
    func setTitle(_ title: String?) -> Self {
        var copy = self
        copy.textLabel = title
        
        return copy
    }
}


struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(iconImage: "folder.fill.badge.plus", textLabel: "생성")
    }
}
