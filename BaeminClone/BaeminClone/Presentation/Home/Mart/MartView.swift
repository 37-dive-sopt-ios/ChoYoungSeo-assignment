//
//  MartView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//


import UIKit
import SnapKit
import Then

final class MartView: BaseUIView {
    
    // MARK: - UI Components
    
    private let martContainerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // MARK: - Setup Methods
    
    override func setLayout() {
        
//        martContainerView.addSubview()
        
        addSubviews(martContainerView)
        
        martContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
