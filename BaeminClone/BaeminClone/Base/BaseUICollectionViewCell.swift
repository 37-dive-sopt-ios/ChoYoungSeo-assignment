//
//  BaseUICollectionViewCell.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import UIKit

class BaseUICollectionViewCell: UICollectionViewCell {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Lifecycle
    
    private func setup() {
        setUI()
        setLayout()
        setAction()
    }
    
    // MARK: - Override Points
    
    func setUI() { }
    
    func setLayout() { }
    
    func setAction() { }
}
