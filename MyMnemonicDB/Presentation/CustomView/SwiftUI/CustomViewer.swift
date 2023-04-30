//
//  CustomViewer.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/15.
//

import SwiftUI

struct CustomViewer: View {
    
    var mNemonicKey: String?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(height: 230)
            .frame(maxWidth: .infinity)
            .foregroundColor(.textFieldBackgroundColor)
            .overlay(
                Text(mNemonicKey ?? "Error!")
                    .foregroundColor(.white)
                    .font(.bold14())
            )
    }
}

struct CustomViewer_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewer(mNemonicKey: "ranch time gravity autumn comfort fatigue orbit disease soccer mean fabric recycle")
    }
}
