//
//  PopupView.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/15.
//

import SwiftUI

import CustomTextField

struct PopupView: View {
    
    weak var navigation: NavigationController?
    
    @StateObject private var viewModel = PopupViewModel()
    
    //Dismiss
    var action : () -> ()
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(spacing: 40){
                VStack(spacing: 20){
                    Text("Create Folder")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .font(.bold20())
                        .multilineTextAlignment(.center)
                    
                    EGTextField(text: $viewModel.folderTitle)
                        .setTextColor(.white)
                        .setBackgroundColor(.textFieldBackgroundColor)
                        .setCornerRadius(12)
                        .setTextFieldHeight(48)
                        .setBorderWidth(1.5)
                        .setBorderColor(.buttonBackgroundColor)
                        .setTitleText("Input Folder Name")
                        .setTitleFont(.medium14())
                        .setTitleColor(.white)
                }
                HStack(alignment: .center, spacing: 12) {
                    CustomButton()
                        .setType(type: .normal)
                        .setTitle(title: "OK")
                        .click {
                            //MARK: 폴더이름 DB 저장
                            viewModel.createFolder(folderName: viewModel.folderTitle)
                            print("폴더이름 DB 저장 완료")
                            action()
                            print("패치폴더 카운트: ", viewModel.folderRepo.fetchFolder().count)
                        }
                    
                    CustomButton()
                        .setType(type: .clear)
                        .setTitle(title: "Cancel")
                        .click {
                            print("폴더이름 DB 저장 취소됨")
                            action()
                            print("패치폴더 카운트: ", viewModel.folderRepo.fetchFolder().count)
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView() {
            print("")
        }
    }
}
