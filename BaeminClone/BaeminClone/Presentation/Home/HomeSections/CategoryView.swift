//
//  CategoryView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class CategoryView: BaseUIView {
    
    // MARK: - UI Components
    
    private let categoryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 14
    }

    private let deliveryLabel = UILabel().then {
        $0.text = "음식배달"
        $0.font = .pretendard(.head_b_18)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }

    private let pickupLabel = UILabel().then {
        $0.text = "픽업"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminGray300
        $0.textAlignment = .center
    }

    private let shoppingLabel = UILabel().then {
        $0.text = "장보기·쇼핑"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminGray300
        $0.textAlignment = .center
    }

    private let giftLabel = UILabel().then {
        $0.text = "선물하기"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminGray300
        $0.textAlignment = .center
    }

    private let benefitLabel = UILabel().then {
        $0.text = "혜택모아보기"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminGray300
        $0.textAlignment = .center
    }
    
    private let dividerView = UIView().then {
        $0.backgroundColor = .baeminGray200
    }
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 62, height: 78)
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.contentInset = UIEdgeInsets(top: 12, left: 16, bottom: 21, right: 16)
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        categoryStackView.addArrangedSubviews(deliveryLabel, pickupLabel, shoppingLabel, giftLabel, benefitLabel)
        addSubviews(categoryStackView, dividerView, collectionView)
    }
    
    override func setLayout() {
    
        categoryStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(categoryStackView.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
