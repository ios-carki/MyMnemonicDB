//
//  SUMainView.swift
//  MyMnemonicDB
//
//  Created by Carki on 2023/05/01.
//

import SwiftUI

struct SUMainView: View {
    
    weak var navigation: NavigationController?
    
    @StateObject private var viewModel = MainViewModel()
    @State var folder = FolderRepository()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack(spacing: 20) {
                    HStack(spacing: 10) {
                        ImageButton()
                            .setImage("folder.fill.badge.plus")
                            .setTitle("폴더 추가")
                            .onTapGesture {
                                viewModel.popupPresent = true
                            }
                            .overCurrentContext(isPresented: $viewModel.popupPresent) {
                                return AnyView(PopupView(action: {
                                    
                                }))
                            }


//                        ImageButton()
//                            .setImage("folder.fill.badge.plus")
//                            .setTitle("폴더 추가")
//                            .onTapGesture {
//                                viewModel.popupPresent.toggle()
//                            }
                        
                        Spacer()
                        
                        ImageButton()
                            .setImage("doc.badge.plus")
                            .setTitle("파일 추가")
                    }
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(Color.buttonBackgroundColor)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text("Favorite")
                                    .foregroundColor(.white)
                                    .font(.bold28())
                                
                                Spacer()
                            }
                            
                            ForEach(0..<viewModel.folder.fetchFolder().count, id: \.self) { index in
                                NavigationLink {
                                    MnemonicView(viewIndex: index + 1)
                                } label: {
                                    FileListView(index: index + 1, title: "dasfasfsadf")
                                }
                            }
                            
                            HStack {
                                Text("Mnemonic")
                                    .foregroundColor(.white)
                                    .font(.bold28())
                                
                                Spacer()
                            }
                            
                            ForEach(0..<4, id: \.self) { index in
                                FileListView(index: index + 1, title: "dasfasfsadf")
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle("홈")
    }
}

fileprivate var currentOverCurrentContextUIHost: UIHostingController<AnyView>? = nil

extension View {
    
    public func overCurrentContext(
        isPresented: Binding<Bool>,
        showWithAnimation: Bool = false,
        dismissWithAnimation: Bool = false,
        modalTransitionStyle: UIModalTransitionStyle = .crossDissolve,
        modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext,
        afterDismiss: (() -> Void)? = nil,
        content: () -> AnyView
    ) -> some View {
        if isPresented.wrappedValue && currentOverCurrentContextUIHost == nil {
            let uiHost = UIHostingController(rootView: content())
            currentOverCurrentContextUIHost = uiHost
            
            uiHost.modalPresentationStyle = modalPresentationStyle
            uiHost.modalTransitionStyle = modalTransitionStyle
            uiHost.view.backgroundColor = UIColor.clear
            
            let rootVC = UIApplication.shared.windows.first?.rootViewController
            rootVC?.present(uiHost, animated: showWithAnimation, completion: nil)
            
        } else {
            if let uiHost = currentOverCurrentContextUIHost {
                uiHost.dismiss(animated: dismissWithAnimation, completion: {})
                currentOverCurrentContextUIHost = nil
                afterDismiss?()
            }
        }
        
        return self
    }
}

struct SUMainView_Previews: PreviewProvider {
    static var previews: some View {
        SUMainView()
    }
}
