//
//  NavigationBar.swift
//  BaeminClone
//
//  Created by 조영서 on 10/26/25.
//

import UIKit
import SnapKit

final class NavigationBar: UIView {
    
    // MARK: - Properties
    
    var backAction: (() -> Void)?
    
    // MARK: - UI Components

    private let backButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "ic_arrow_left"), for: .normal)
        $0.tintColor = .black
    }

    private let titleLabel = UILabel().then {
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .black
        $0.textAlignment = .center
    }

    // MARK: - Init
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        addSubviews(backButton, titleLabel)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func backButtonTapped() {
        backAction?()
    }
    
    // MARK: - Public Methods
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
