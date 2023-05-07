//
//  MainViewController.swift
//  MyMnemonicDB
//
//  Created by Carki on 2023/04/30.
//

import UIKit
import SwiftUI

import BottomSheet

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    private let folderDB = FolderRepository()
    private let mnemonicDB = MnemonicRepository()
    private var nowFolderDBCount = FolderRepository().fetchFolder().count
    
    override func loadView() {
        view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        folderDB.fetchFolder()
        mnemonicDB.fetchMnemonic()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("현재 폴더DB 개수: ", nowFolderDBCount)
        setMnemonicList()
        setAddFolderButton()
        setAddFileButton()
    }
    
    private func setMnemonicList() {
        mainView.mNemonicList.register(MnemonicCell.self, forCellReuseIdentifier: MnemonicCell.identifier)
        mainView.mNemonicList.delegate = self
        mainView.mNemonicList.dataSource = self
    }
    
    private func setAddFolderButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(folderButtonClicked))
        mainView.leftImageButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func folderButtonClicked() {
        let delegate = BottomSheetTransitioningDelegate(configuration: .default)
        let vc = UIHostingController(rootView: PopupView(action: {
            self.dismiss(animated: true)
            if self.nowFolderDBCount != self.folderDB.fetchFolder().count {
                self.nowFolderDBCount = self.folderDB.fetchFolder().count
                self.mainView.mNemonicList.reloadData()
                print("데이터 변동 감지, 테이블뷰 리로드")
            } else {
                print("데이터 변동 없음 테이블뷰 리로드 취소")
            }
        }))
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = delegate
        self.present(vc, animated: true)
    }
    
    private func setAddFileButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(fileButtonClicked))
        mainView.rightImageButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func fileButtonClicked() {
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //MARK: 임시 - 1번째 섹션 - 폴더 / 2번째 섹션 - 파일
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? folderDB.fetchFolder().count : mnemonicDB.fetchMnemonic().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MnemonicCell.identifier, for: indexPath) as? MnemonicCell else { return UITableViewCell() }
        
        cell.cellNumber.text = String(indexPath.row)
        cell.fileName.text = String("임시: \(indexPath.row)")
        
        return cell
    }
    
    
}
