//
//  MnemonicView.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/15.
//

import SwiftUI

struct MnemonicView: View {
    
    @StateObject private var viewModel = MnemonicViewModel()
    var viewIndex: Int
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .center) {
                    Text("어플이름")
                        .foregroundColor(.white)
                        .font(.bold28())
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.textFieldBackgroundColor)
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image(systemName: (viewModel.viewState == false) ? "doc.plaintext" : "list.number")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.buttonBackgroundColor)
                        )
                        .onTapGesture {
                            viewModel.viewState.toggle()
                        }
                }
                
                if viewModel.viewState {
                    
                } else {
                    CustomViewer()
                }
                
                Spacer()
                
                CustomButton()
                    .setType(type: .normal)
                    .setTitle(title: "클립보드에 저장")
                
            }
            .padding(.horizontal, 16)
        }
    }
}

struct MnemonicView_Previews: PreviewProvider {
    static var previews: some View {
        MnemonicView(viewIndex: 1)
    }
}
