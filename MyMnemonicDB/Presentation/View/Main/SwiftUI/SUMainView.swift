////
////  SUMainView.swift
////  MyMnemonicDB
////
////  Created by Carki on 2023/05/01.
////
//
//import SwiftUI
//
//import BottomSheet
//
//struct SUMainView: View {
//    
//    weak var navigation: NavigationController?
//    
//    @StateObject private var viewModel = MainViewModel()
//    @State var folder = FolderRepository()
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.backgroundColor.ignoresSafeArea()
//                VStack(spacing: 20) {
//                    HStack(spacing: 10) {
//                        ImageButton()
//                            .setImage("folder.fill.badge.plus")
//                            .setTitle("폴더 추가")
//                            .onTapGesture {
//                                let delegate = BottomSheetTransitioningDelegate(configuration: .default)
//                                let vc = UIHostingController(rootView: PopupView(action: {
//                                    navigation?.dismiss(animated: true)
//                                }))
//                                vc.modalPresentationStyle = .custom
//                                vc.transitioningDelegate = delegate
//                                navigation?.present(vc, animated: true)
//                            }
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
//                            ForEach(0..<viewModel.folderCounter, id: \.self) { index in
//                                NavigationLink {
//                                    MnemonicView()
//                                } label: {
//                                    FileListView(index: index + 1, title: viewModel.folder.fetchFolder()[index].title)
//                                }
//                                
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
//    }
//}
//
//struct SUMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        SUMainView()
//    }
//}
