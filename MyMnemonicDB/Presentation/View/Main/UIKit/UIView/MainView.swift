//
//  MainView.swift
//  MyMnemonicDB
//
//  Created by Carki on 2023/04/23.
//

import UIKit
import SwiftUI

import SnapKit

final class MainView: BaseView {
    
    let topView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    
    let leftImageButton: KitCustomButton = {
        let view = KitCustomButton()
        view.iconImage.image = UIImage(systemName: "folder.fill.badge.plus")
        view.buttonTitle.text = "폴더 추가"
        return view
    }()
    
    let rightImageButton: KitCustomButton = {
        let view = KitCustomButton()
        view.iconImage.image = UIImage(systemName: "doc.badge.plus")
        view.buttonTitle.text = "파일 추가"
        
        return view
    }()
    
    let divideLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(Color.buttonBackgroundColor)
        return view
    }()
    
    let mNemonicList: UITableView = {
        let view = UITableView()
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = UIColor(Color.backgroundColor)
        view.rowHeight = 70
        return view
    }()
    
    override func configureUI() {
        [leftImageButton, rightImageButton].forEach {
            topView.addArrangedSubview($0)
        }
        [topView, divideLine, mNemonicList].forEach {
            self.addSubview($0)
        }
        self.backgroundColor = UIColor(Color.backgroundColor)
    }
    
    override func setConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        leftImageButton.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        rightImageButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.equalTo(leftImageButton.snp.trailing).offset(12)
        }
        
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(leftImageButton.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(2)
        }
        
        mNemonicList.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.equalToSuperview()
        }
    }
}



//import SwiftUI
//
//import PopupView
//
//struct MainView: View {
//    weak var navigation: NavigationController?
//    @StateObject private var viewModel = MainViewModel()
//    @State var folder = FolderRepository()
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.backgroundColor.ignoresSafeArea()
//                VStack(spacing: 20) {
//                    HStack(spacing: 10) {
//                        NavigationLink {
//                            PopupView {
//
//                            }
//                        } label: {
//                            ImageButton()
//                                .setImage("folder.fill.badge.plus")
//                                .setTitle("폴더 추가")
//                        }
//
//                        Spacer()
//
//                        ImageButton()
//                            .setImage("doc.badge.plus")
//                            .setTitle("파일 추가")
//                    }
//
//                    Divider()
//                        .frame(height: 2)
//                        .overlay(Color.buttonBackgroundColor)
//
//                    ScrollView {
//                        VStack(alignment: .leading, spacing: 14) {
//                            HStack {
//                                Text("Favorite")
//                                    .foregroundColor(.white)
//                                    .font(.bold28())
//
//                                Spacer()
//                            }
//
//                            ForEach(0..<viewModel.folder.fetchFolder().count, id: \.self) { index in
//                                NavigationLink {
//                                    MnemonicView(viewIndex: index + 1)
//                                } label: {
//                                    FileListView(index: index + 1, title: "dasfasfsadf")
//                                }
//                            }
//
//                            HStack {
//                                Text("Mnemonic")
//                                    .foregroundColor(.white)
//                                    .font(.bold28())
//
//                                Spacer()
//                            }
//
//                            ForEach(0..<4, id: \.self) { index in
//                                FileListView(index: index + 1, title: "dasfasfsadf")
//                            }
//                        }
//                    }
//                }
//                .padding(.horizontal, 16)
//            }
//        }
//        .navigationTitle("홈")
//        .popup(isPresented: $viewModel.popupPresent) {
//            PopupView() {
//                print("액션")
//                viewModel.popupPresent.toggle()
//            }
//        } customize: {
//            $0
//                .type(.default)
//                .position(.bottom)
//                .closeOnTapOutside(true)
//                .backgroundColor(.black.opacity(0.7))
//        }
//    }
//}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
