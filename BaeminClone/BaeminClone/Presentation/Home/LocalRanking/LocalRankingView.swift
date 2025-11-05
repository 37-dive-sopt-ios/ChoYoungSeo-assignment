//
//  LocalRankingView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class LocalRankingView: BaseUIView {

// MARK: - UI Components
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.baeminBluePurple500.cgColor,
            UIColor.baeminBluePurple500.withAlphaComponent(0.0).cgColor
        ]
        layer.locations = [0.0, 0.3, 1.0]
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        return layer
    }()

    private let titleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 3
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "우리 동네 한그릇 인기 랭킹"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminWhite
        $0.textAlignment = .center
    }
    
    private let chevronImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_chevron_right")
        $0.tintColor = .baeminWhite
        $0.contentMode = .scaleAspectFit
    }
    
    private let allItemsArrowLabelView = ArrowLabelView().then {
        $0.configure(text: "전체보기")
    }

    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .white
        layer.insertSublayer(gradientLayer, at: 0)

        titleStackView.addArrangedSubviews(titleLabel, chevronImageView)
    }
    
    override func setLayout() {
        
        addSubviews(titleStackView, allItemsArrowLabelView)
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
        }

        allItemsArrowLabelView.snp.makeConstraints {
            $0.centerY.equalTo(titleStackView)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
