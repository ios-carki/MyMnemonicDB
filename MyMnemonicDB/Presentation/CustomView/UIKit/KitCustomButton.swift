//
//  KitCustomButton.swift
//  MyMnemonicDB
//
//  Created by Carki on 2023/04/29.
//

import UIKit
import SwiftUI

import SnapKit

class KitCustomButton: BaseView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.backgroundColor = UIColor(Color.textFieldBackgroundColor)
        return view
    }()
    
    let iconImage: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(Color.buttonBackgroundColor)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let buttonTitle: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(Color.buttonBackgroundColor)
        view.font = .semiBold16()
        return view
    }()
    
    override func configureUI() {
        [iconImage, buttonTitle].forEach {
            backgroundView.addSubview($0)
        }
        self.addSubview(backgroundView)
    }
    
    override func setConstraints() {
        
        backgroundView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(66)
        }
        
        iconImage.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundView.safeAreaLayoutGuide)
            make.leading.equalTo(backgroundView.safeAreaLayoutGuide).offset(30)
            make.size.equalTo(32)
        }
        
        buttonTitle.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundView.safeAreaLayoutGuide)
            make.trailing.equalTo(backgroundView.safeAreaLayoutGuide).offset(-30)
            
        }
    }
}
