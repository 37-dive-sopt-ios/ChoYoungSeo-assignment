//
//  BannerView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class BannerView: BaseUIView {
    
    // MARK: - UI Components
    
    private let martContainerView = UIView().then {
        $0.backgroundColor = .yellow
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .yellow
    }
    
    override func setLayout() {
                
        addSubviews(martContainerView)
        
        martContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
