//
//  MnemonicCell.swift
//  MyMnemonicDB
//
//  Created by Carki on 2023/05/01.
//

import UIKit
import SwiftUI

final class MnemonicCell: UITableViewCell {
    static let identifier = "MnemonicCell"
    
    let cellNumber: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(Color.buttonBackgroundColor)
        view.font = .bold16()
        return view
    }()
}
