//
//  MnemonicView.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/15.
//

import SwiftUI
import UIKit

import CustomTextField
import TextView

struct MnemonicView: View {
    weak var navigation: NavigationController?
    
    @StateObject private var viewModel = MnemonicViewModel()
    
    var mNemonicText: String?
    var viewMode: ViewMode
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .center) {
                        EGTextField(text: $viewModel.appTitle)
                            .setPlaceHolderText("Enter MnemonicName")
                            .setTextFieldHeight(50)
                            .setBorderWidth(1.5)
                    }
                    
                    //EditMode & ViewModel
                    if viewMode == .editMode {
                        TextView($viewModel.mNemonicText)
                            .font(UIFont.semiBold16())
                            .foregroundColor(UIColor.white)
                            .padding(.all, 10)
                            .border(Color.buttonBackgroundColor)
                            .background(Color.textFieldBackgroundColor)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.buttonBackgroundColor, lineWidth: 1.5)
                            )
                            .frame(height: 400)
                    } else {
                        CustomViewer()
                    }
                    
                    if viewMode == .viewMode {
                        HStack {
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.textFieldBackgroundColor)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    VStack(spacing: 8, content: {
                                        Image(systemName: "doc.plaintext")//(viewMode == .viewMode) ? "doc.plaintext" : "list.number")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.buttonBackgroundColor)
                                        
                                        Text("Copy")
                                            .foregroundColor(.buttonBackgroundColor)
                                            .font(.semiBold12())
                                    })
                                )
                                .onTapGesture {
                                    //                            UIPasteboard.general.string =
                                }
                        }
                    }
                    
                    Spacer()
                    
                    CustomButton()
                        .setType(type: .normal)
                        .setTitle(title: (viewMode == .viewMode) ? "Ok" : "Save")//"클립보드에 저장")
                    
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle((viewMode == .viewMode) ? "니모닉키 확인" : "니모닉키 입력")
    }
}

struct MnemonicView_Previews: PreviewProvider {
    static var previews: some View {
        MnemonicView(viewMode: .editMode)
    }
}
