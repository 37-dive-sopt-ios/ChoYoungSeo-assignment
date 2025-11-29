//
//  MartView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class MartView: BaseUIView {
    
    // MARK: - UI Components
    
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 62, height: 78)
        layout.minimumLineSpacing = 9
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets(top: 11, left: 16, bottom: 11, right: 16)
    }
        
    // MARK: - Setup Methods
    
    override func setUI() {
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
