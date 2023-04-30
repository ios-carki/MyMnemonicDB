//
//  FileListView.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/15.
//

import SwiftUI

struct FileListView: View {
    
    @State var index: Int
    @State var title: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(height: 50)
            .foregroundColor(.textFieldBackgroundColor)
            .overlay(
                HStack(alignment: .center, content: {
                    Text(String(index) + ".")
                        .foregroundColor(.buttonBackgroundColor)
                        .font(.bold16())
                        .padding(.leading, 12)
                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.semiBold14())
                    
                    Spacer()
                })
            )
    }
}

struct FileListView_Previews: PreviewProvider {
    static var previews: some View {
        FileListView(index: 1, title: "임시 니모닉이름")
    }
}
