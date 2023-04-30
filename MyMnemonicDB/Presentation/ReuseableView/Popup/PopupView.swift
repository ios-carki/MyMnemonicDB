//
//  PopupView.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/15.
//

import SwiftUI

import CustomTextField

struct PopupView: View {
    
    @StateObject private var viewModel = PopupViewModel()
    
    //Dismiss
    var action : () -> ()
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3).ignoresSafeArea().onTapGesture {
                action()
                print("빈공간 눌림")
            }
            
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
                CustomButton()
                    .setType(type: .normal)
                    .setTitle(title: "OK")
                    .click {
                        //MARK: 폴더이름 DB 저장
                        viewModel.createFolder(folderName: viewModel.folderTitle)
                        print("폴더이름 DB 저장 완료")
                        action()
                    }
            }.padding(25)
                .background(Color.textFieldBackgroundColor)
                .cornerRadius(15)
                .padding(25)
                .padding(.bottom, 50)
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
