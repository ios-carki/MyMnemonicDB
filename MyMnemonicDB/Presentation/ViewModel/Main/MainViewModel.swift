//
//  MainViewModel.swift
//  MnemonicDB
//
//  Created by Carki on 2023/03/26.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Published var folder = FolderRepository()
    @Published var folderCounter = FolderRepository().fetchFolder().count
    
    @Published var folderTitle: String = ""
    
    @Published var FolderCount: Int = 0
    @Published var MnemonicCount: Int = 0
    
}
