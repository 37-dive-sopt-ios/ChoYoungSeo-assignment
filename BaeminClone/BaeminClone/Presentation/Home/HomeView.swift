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
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
    }
    
    private let contentView = UIView()
    
    private let gradientContainerView = UIView()
    
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.baeminMint100.cgColor,
            UIColor.baeminMint100.cgColor,
            UIColor.baeminMint100.withAlphaComponent(0.0).cgColor
        ]
        layer.locations = [0.0, 0.25, 1.0]
        layer.startPoint = CGPoint(x: 0.5, y: 1.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.0)
        return layer
    }()
    
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
    
    let searchTextField = UITextField().then {
        $0.setPlaceholder("찾아라! 맛있는 음식과 맛집", color: .baeminGray300, font: .pretendard(.body_r_14))
        $0.font = .pretendard(.body_r_14)
        $0.backgroundColor = .white
        $0.borderStyle = .none
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminBlack.cgColor
        $0.leftPadding(17)
        $0.rightPadding(45)
    }
    
    private let searchButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .baeminGray700
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
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.baeminMint500.cgColor
        $0.layer.shadowOpacity = 0.25
        $0.layer.shadowOffset = CGSize(width: 0, height: -4)
        $0.layer.shadowRadius = 4
    }

    
    private let menuView = MenuView()
    private let martView = MartView()
    private let bannerView = BannerView()
    private let localRankingView = LocalRankingView()
    private let recentOrderView = RecentOrderView()
    private let discountStoreView = DiscountStoreView()
    
    private let foodDeliveryArrowContainerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let foodDeliveryArrowLabelView = ArrowLabelView().then {
        $0.configure(text: "음식배달에서 더보기", boldText: "음식배달")
    }
    
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .baeminBackgroundWhite
        
        gradientContainerView.layer.insertSublayer(gradientLayer, at: 0)
        
        locationStackView.addArrangedSubviews(locationLabel, locationToggleImageView)
        topButtonStackView.addArrangedSubviews(discountButton, alarmButton, cartButton)
    }
    
    override func setLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        foodDeliveryArrowContainerView.addSubview(foodDeliveryArrowLabelView)
        
        gradientContainerView.addSubviews(
            bMartLogoImageView,
            promoLabel,
            chevronImageView,
            topRoundedContainerView
        )
        
        contentView.addSubviews(
            locationStackView,
            topButtonStackView,
            searchTextField,
            searchButton,
            gradientContainerView,
            menuView,
            martView,
            bannerView,
            localRankingView,
            recentOrderView,
            discountStoreView,
            foodDeliveryArrowContainerView
        )
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }
        
        locationStackView.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(9)
            $0.leading.equalToSuperview().inset(16)
        }
        
        topButtonStackView.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(9)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        locationToggleImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 8, height: 5))
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(locationStackView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(-33)
            $0.size.equalTo(24)
        }
        
        gradientContainerView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview()
        }
        
        bMartLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(CGSize(width: 50, height: 16))
        }
        
        promoLabel.snp.makeConstraints {
            $0.top.equalTo(bMartLogoImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalTo(promoLabel)
            $0.leading.equalTo(promoLabel.snp.trailing).offset(2)
            $0.size.equalTo(12)
        }
        
        topRoundedContainerView.snp.makeConstraints {
            $0.top.equalTo(promoLabel.snp.bottom).offset(27)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(16)
            $0.bottom.equalToSuperview()
        }
        
        menuView.snp.makeConstraints {
            $0.top.equalTo(gradientContainerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(201)
        }
        
        foodDeliveryArrowContainerView.snp.makeConstraints {
            $0.top.equalTo(menuView.snp.bottom).offset(1)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(34)
        }
        
        foodDeliveryArrowLabelView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        martView.snp.makeConstraints {
            $0.top.equalTo(foodDeliveryArrowContainerView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(96)
        }
        
        bannerView.snp.makeConstraints {
            $0.top.equalTo(martView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(114)
        }
        
        localRankingView.snp.makeConstraints {
            $0.top.equalTo(bannerView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(323)
        }
        
        recentOrderView.snp.makeConstraints {
            $0.top.equalTo(localRankingView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(292)
        }
        
        discountStoreView.snp.makeConstraints {
            $0.top.equalTo(recentOrderView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(384)
            $0.bottom.equalToSuperview()
        }
        
        [discountButton, alarmButton, cartButton].forEach {
            $0.snp.makeConstraints { $0.size.equalTo(24) }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        gradientLayer.frame = gradientContainerView.bounds
    }
}
