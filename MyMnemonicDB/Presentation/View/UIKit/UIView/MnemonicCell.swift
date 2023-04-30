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
    
    let cellBackground: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(Color.textFieldBackgroundColor)
        view.layer.cornerRadius = 12
        return view
    }()
    
    let cellNumber: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(Color.buttonBackgroundColor)
        view.font = .bold16()
        return view
    }()
    
    let fileName: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .semiBold14()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        [cellNumber, fileName].forEach {
            cellBackground.addSubview($0)
        }
        
        contentView.addSubview(cellBackground)
    }
    
    private func setLayout() {
        
        cellBackground.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        cellNumber.snp.makeConstraints { make in
            make.centerY.equalTo(cellBackground.safeAreaLayoutGuide)
            make.leading.equalTo(cellBackground.safeAreaLayoutGuide).offset(12)
        }
        
        fileName.snp.makeConstraints { make in
            make.centerY.equalTo(cellBackground.safeAreaLayoutGuide)
            make.leading.equalTo(cellNumber.snp.trailing).offset(-12)
        }
    }
}
