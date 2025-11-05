//
//  DiscountStoreView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class DiscountStoreView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 3
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "무조건 할인하는 가게"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let chevronImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_chevron_right")
        $0.contentMode = .scaleAspectFit
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "2천원 이상 또는 15% 이상 할인중"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminGray300
        $0.textAlignment = .center
    }
    
    private let discountImageView = UIImageView().then {
        $0.image = UIImage(named: "img_discount")
        $0.contentMode = .scaleAspectFit
    }
    
    private let discountStoreContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminGray200.cgColor
        $0.layer.cornerRadius = 17
        $0.layer.masksToBounds = true
    }
    
    private let discountStoreArrowLabelView = ArrowLabelView().then {
        $0.configure(text: "할인하는 가게 더보기", boldText: "할인하는 가게")
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .white
        titleStackView.addArrangedSubviews(titleLabel, chevronImageView)
    }
    
    override func setLayout() {
        discountStoreContainerView.addSubview(discountStoreArrowLabelView)
        
        addSubviews(
            titleStackView,
            subTitleLabel,
            discountImageView,
            discountStoreContainerView
        )
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27.5)
            $0.leading.equalToSuperview().inset(16)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        discountImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(23)
            $0.size.equalTo(CGSize(width: 59, height: 66))
        }
        
        discountStoreContainerView.snp.makeConstraints {
            $0.top.equalTo(discountImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 152, height: 34))
        }
        
        discountStoreArrowLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
