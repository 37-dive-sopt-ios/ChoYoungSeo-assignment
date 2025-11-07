//
//  HomeStoreInfoCell.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import UIKit
import SnapKit
import Then

enum StoreInfoType {
    case recentOrder
    case discountStore
}

final class HomeStoreInfoCell: BaseUICollectionViewCell {
    
    // MARK: - UI Components
    
    private let orderInfoImageView = UIImageView().then {
        $0.backgroundColor = .baeminGray200
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let recentOrderImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_time")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .baeminBlue
        $0.contentMode = .scaleAspectFit
    }
    
    private let recentOrderLabel = UILabel().then {
        $0.text = "최근 1번 주문한 가게"
        $0.font = .pretendard(.body_r_12)
        $0.textColor = .baeminBlue
        $0.textAlignment = .center
    }
    
    private let storeNameLabel = UILabel().then {
        $0.font = .pretendard(.head_b_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    
    private let ratingImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_star")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .baeminYellow
        $0.contentMode = .scaleAspectFit
    }
    
    private let ratingLabel = UILabel().then {
        $0.font = .pretendard(.head_b_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let reviewCountLabel = UILabel().then {
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let deliveryTimeImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_baemin_money")
        $0.contentMode = .scaleAspectFit
    }
    
    private let deliveryTimeLabel = UILabel().then {
        $0.font = .pretendard(.body_r_13)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let freeDeliveryImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_bamin_club")
        $0.contentMode = .scaleAspectFit
    }
    
    private let freeDeliveryLabel = UILabel().then {
        $0.text = "무료배달"
        $0.font = .pretendard(.head_b_13)
        $0.textColor = .baeminBluePurple700
        $0.textAlignment = .center
    }
    
    private let baeminClubImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_bamin_club")
        $0.contentMode = .scaleAspectFit
    }
    
    private let baeminClubLabel = UILabel().then {
        $0.text = "배민클럽"
        $0.font = .pretendard(.title_sb_10)
        $0.textColor = .baeminMint600
        $0.textAlignment = .center
    }
    
    private let baeminClubContainerView = UIView().then {
        $0.backgroundColor = .baeminMint500.withAlphaComponent(0.1)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminMint500.cgColor
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    
    private let pickupAvailableLabel = UILabel().then {
        $0.text = "픽업가능"
        $0.font = .pretendard(.title_sb_10)
        $0.textColor = .baeminGray800
        $0.textAlignment = .center
    }
    
    private let pickupAvailableContainerView = UIView().then {
        $0.backgroundColor = .baeminBackgroundWhite
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    
    // MARK: - StackViews
    
    private let recentOrderStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 2
    }
    
    private let ratingStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 2
    }
    
    private let storeInfoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 5
    }
    
    private let deliveryTimeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 2
    }
    
    private let freeDeliveryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 2
    }
    
    private let deliveryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 6
    }
    
    private let baeminClubStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 2
    }
    
    private let chipStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .leading
        $0.spacing = 6
    }
    
    private let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 7
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        recentOrderStackView.addArrangedSubviews(recentOrderImageView, recentOrderLabel)
        ratingStackView.addArrangedSubviews(ratingImageView, ratingLabel)
        storeInfoStackView.addArrangedSubviews(storeNameLabel, ratingStackView, reviewCountLabel)
        deliveryTimeStackView.addArrangedSubviews(deliveryTimeImageView, deliveryTimeLabel)
        freeDeliveryStackView.addArrangedSubviews(freeDeliveryImageView, freeDeliveryLabel)
        deliveryStackView.addArrangedSubviews(deliveryTimeStackView, freeDeliveryStackView)
        baeminClubStackView.addArrangedSubviews(baeminClubImageView, baeminClubLabel)
        chipStackView.addArrangedSubviews(baeminClubContainerView, pickupAvailableContainerView)
        contentStackView.addArrangedSubviews(storeInfoStackView, deliveryStackView,chipStackView)
        
        baeminClubContainerView.addSubview(baeminClubStackView)
        pickupAvailableContainerView.addSubview(pickupAvailableLabel)
        
        contentView.addSubviews(orderInfoImageView, recentOrderStackView, contentStackView)
    }
    
    override func setLayout() {
        orderInfoImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 188, height: 126))
        }
        
        recentOrderStackView.snp.makeConstraints {
            $0.top.equalTo(orderInfoImageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(recentOrderStackView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
        }
        
        baeminClubStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        pickupAvailableLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        baeminClubContainerView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 56, height: 16))
        }
        
        pickupAvailableContainerView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 44, height: 16))
        }
        
        recentOrderImageView.snp.makeConstraints {
            $0.size.equalTo(12)
        }
        
        ratingImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 11, height: 10))
        }

        deliveryTimeImageView.snp.makeConstraints {
            $0.size.equalTo(13)
        }
        
        freeDeliveryImageView.snp.makeConstraints {
            $0.size.equalTo(12)
        }
        
        baeminClubImageView.snp.makeConstraints {
            $0.size.equalTo(10)
        }
    }
}

// MARK: - Configure

extension HomeStoreInfoCell {
    func configure(_ model: HomeStoreInfoModel, type: StoreInfoType) {
        storeNameLabel.text = model.storeName
        ratingLabel.text = String(format: "%.1f", model.rating)
        reviewCountLabel.text = "(\(formatNumber(model.reviewCount)))"
        deliveryTimeLabel.text = model.deliveryTime

        switch type {
        case .recentOrder:
            recentOrderStackView.isHidden = false
        case .discountStore:
            recentOrderStackView.isHidden = true
        }
    }

    private func formatNumber(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
