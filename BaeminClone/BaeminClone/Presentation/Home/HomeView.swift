//
//  HomeView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/1/25.
//


import UIKit
import SnapKit
import Then

final class HomeView: BaseUIView {
    
    // MARK: - UI Components
    
    private let locationLabel = UILabel().then {
        $0.text = "우리집"
        $0.font = .pretendard(.head_b_16)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let locationToggleImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_polygon_toggle")
        $0.contentMode = .scaleAspectFit
    }
    
    private let locationStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 3
    }
    
    private let discountButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_baemin_discount"), for: .normal)
    }

    private let alarmButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_alarm"), for: .normal)
    }

    private let cartButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_cart"), for: .normal)
    }

    private let topButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 12
    }
    
    private let bMartLogoImageView = UIImageView().then {
        $0.image = UIImage(named: "img_b_mart")
        $0.contentMode = .scaleAspectFit
    }

    private let promoLabel = UILabel().then {
        $0.text = "전상품 쿠폰팩 + 60%특가"
        $0.font = .pretendard(.head_b_16)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }

    private let chevronImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_chevron_right")
        $0.contentMode = .scaleAspectFit
    }
    
    private let topRoundedContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.masksToBounds = true
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .baeminBackgroundWhite
        
        locationStackView.addArrangedSubviews(locationLabel, locationToggleImageView)
        topButtonStackView.addArrangedSubviews(discountButton, alarmButton, cartButton)
    }
    
    override func setLayout() {
        addSubviews(
            locationStackView,
            topButtonStackView,
            bMartLogoImageView,
            promoLabel,
            chevronImageView,
            topRoundedContainerView
        )
        
        locationStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(9)
            $0.leading.equalToSuperview().inset(16)
        }
        
        topButtonStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(9)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        locationToggleImageView.snp.makeConstraints {
            $0.height.equalTo(5)
            $0.width.equalTo(8)
        }
        
        bMartLogoImageView.snp.makeConstraints {
            $0.top.equalTo(locationStackView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(16)
            $0.width.equalTo(50)
        }
        
        promoLabel.snp.makeConstraints {
            $0.top.equalTo(bMartLogoImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalTo(promoLabel)
            $0.leading.equalTo(promoLabel.snp.leading).offset(-2)
            $0.size.equalTo(12)
        }
        
        topRoundedContainerView.snp.makeConstraints {
            $0.top.equalTo(promoLabel.snp.bottom).offset(27)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        discountButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
        
        alarmButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
        
        cartButton.snp.makeConstraints {
            $0.size.equalTo(24)
        }
    }
}
