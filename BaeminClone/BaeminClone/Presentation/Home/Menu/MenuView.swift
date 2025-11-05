//
//  MenuView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//


import UIKit
import SnapKit
import Then

final class MenuView: BaseUIView {
    
    // MARK: - UI Components
    
    private let menuContainerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // MARK: - Setup Methods
    
    override func setLayout() {
        
//        menuContainerView.addSubview()
        
        addSubviews(menuContainerView)
        
        menuContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
