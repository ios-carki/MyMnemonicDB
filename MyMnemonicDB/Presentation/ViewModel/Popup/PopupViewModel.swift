//
//  PopupViewModel.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/23.
//

import SwiftUI

final class PopupViewModel: ObservableObject {
    @Published var folderRepo = FolderRepository()
    @Published var folderTitle: String = ""
    
    func createFolder(folderName: String) {
        folderRepo.saveFolder(title: folderName)
        folderRepo.fetchFolder()
    }
}
