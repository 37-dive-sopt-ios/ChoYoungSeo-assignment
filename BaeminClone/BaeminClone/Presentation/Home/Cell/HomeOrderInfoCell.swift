//
//  HomeOrderInfoCell.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import UIKit
import SnapKit
import Then

final class HomeOrderInfoCell: BaseUICollectionViewCell, ReuseIdentifiable {
    
    // MARK: - UI Components
    
    private let orderInfoImageView = UIImageView().then {
        $0.backgroundColor = .baeminGray200
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    private let storeNameLabel = UILabel().then {
        $0.font = .pretendard(.body_r_12)
        $0.textColor = .baeminGray600
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    
    private let ratingImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_star")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .baeminYellow
        $0.contentMode = .scaleAspectFit
    }
    
    private let ratingLabel = UILabel().then {
        $0.font = .pretendard(.body_r_12)
        $0.textColor = .baeminGray600
        $0.textAlignment = .center
    }
    
    private let reviewCountLabel = UILabel().then {
        $0.font = .pretendard(.body_r_12)
        $0.textColor = .baeminGray600
        $0.textAlignment = .center
    }
    
    private let menuNameLabel = UILabel().then {
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    
    private let discountRateLabel = UILabel().then {
        $0.font = .pretendard(.head_b_14)
        $0.textColor = .baeminRed
        $0.textAlignment = .center
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .pretendard(.head_b_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let originalPriceLabel = UILabel().then {
        $0.font = .pretendard(.body_r_12)
        $0.textColor = .baeminGray600
        $0.textAlignment = .center
    }
    
    private let minOrderLabel = UILabel().then {
        $0.text = "최소주문금액 없음"
        $0.font = .pretendard(.head_b_13)
        $0.textColor = .baeminBluePurple700
        $0.textAlignment = .center
    }
    
    // MARK: - StackViews
    
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
    
    private let priceStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 6
    }
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 6
    }
    
    private let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 9
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        ratingStackView.addArrangedSubviews(ratingImageView, ratingLabel)
        storeInfoStackView.addArrangedSubviews(storeNameLabel, ratingStackView, reviewCountLabel)
        priceStackView.addArrangedSubviews(discountRateLabel, priceLabel)
        infoStackView.addArrangedSubviews(storeInfoStackView, menuNameLabel, priceStackView, originalPriceLabel, minOrderLabel)
        contentStackView.addArrangedSubviews(orderInfoImageView, infoStackView)
        
        contentView.addSubview(contentStackView)
    }
    
    override func setLayout() {
        orderInfoImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.size.equalTo(145)
        }
        
        ratingImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 11, height: 10))
        }
        
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Configure

extension HomeOrderInfoCell {
    func configure(_ model: HomeOrderInfoModel) {
        orderInfoImageView.image = model.image
        storeNameLabel.text = model.storeName
        ratingLabel.text = String(format: "%.1f", model.rating)
        
        if let count = model.reviewCount {
            reviewCountLabel.text = "(\(count))"
        } else {
            reviewCountLabel.text = nil
        }
        
        menuNameLabel.text = model.menuName
        discountRateLabel.text = "\(model.discountRate)%"
        priceLabel.text = formatPrice(model.price)
        
        originalPriceLabel.attributedText = NSAttributedString(
            string: formatPrice(model.originalPrice),
            attributes: [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .strikethroughColor: UIColor.baeminGray600
            ]
        )
    }
    
    private func formatPrice(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return "\(formatter.string(from: NSNumber(value: value)) ?? "\(value)")원"
    }
}
