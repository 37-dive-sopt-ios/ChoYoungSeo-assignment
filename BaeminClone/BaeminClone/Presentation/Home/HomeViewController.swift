//
//  HomeViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let homeView = HomeView()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        view.addSubview(homeView)
    }
    
    override func setLayout() {
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
