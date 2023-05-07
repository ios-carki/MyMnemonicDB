//
//  MnemonicViewModel.swift
//  MnemonicDB
//
//  Created by Carki on 2023/04/15.
//

import SwiftUI

final class MnemonicViewModel: ObservableObject {
    @Published var mNemonicText: String = ""
    @Published var appTitle: String = ""
}
