//
//  CustomMnemonicCellHeader.swift
//  MyMnemonicDB
//
//  Created by Carki on 2023/05/07.
//

import UIKit
import SwiftUI

import SnapKit

final class CustomMnemonicCellHeader: UITableViewHeaderFooterView {
    
    static let identifier = "CustomHeader"
    
    let headerTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .bold24()
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configure()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(headerTitle)
        contentView.backgroundColor = UIColor(Color.backgroundColor)
    }
    
    private func setLayout() {
        headerTitle.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
        }
    }
}
