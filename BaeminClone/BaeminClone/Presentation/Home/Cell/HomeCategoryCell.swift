//
//  HomeCategoryCell.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import UIKit
import SnapKit
import Then

final class HomeCategoryCell: BaseUICollectionViewCell {
    
    // MARK: - UI Components
    
    private let categoryImageView = UIImageView().then {
        $0.backgroundColor = .baeminBackgroundWhite
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private let categoryLabel = UILabel().then {
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    // MARK: - Setup Methods
    
    override func setLayout() {
        contentView.addSubviews(categoryImageView, categoryLabel)

        categoryImageView.snp.makeConstraints {
            $0.size.equalTo(54)
            $0.centerX.equalToSuperview()
        }

        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(categoryImageView.snp.bottom).offset(6)
            $0.centerX.equalTo(categoryImageView)
        }
    }
}

// MARK: - Extension

extension HomeCategoryCell {
    func configure(title: String) {
        categoryLabel.text = title
    }
}
