//
//  RecentOrderView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class RecentOrderView: BaseUIView {
    
    // MARK: - UI Components
    
    private let titleStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 3
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "최근에 주문했어요"
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let infoImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_info")
        $0.contentMode = .scaleAspectFit
    }
    
    private let allItemsArrowLabelView = ArrowLabelView().then {
        $0.configure(text: "전체보기")
    }
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 188, height: 216)
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        backgroundColor = .white
        titleStackView.addArrangedSubviews(titleLabel, infoImageView)
    }
    
    override func setLayout() {
        
        addSubviews(titleStackView, allItemsArrowLabelView, collectionView)
        
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
        }

        allItemsArrowLabelView.snp.makeConstraints {
            $0.centerY.equalTo(titleStackView)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        infoImageView.snp.makeConstraints {
            $0.size.equalTo(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
