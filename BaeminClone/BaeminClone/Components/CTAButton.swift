//
//  CTAButton.swift
//  BaeminClone
//
//  Created by 조영서 on 10/25/25.
//

import UIKit
import SnapKit

final class CTAButton: UIView {
    
    // MARK: - Enum
    
    enum Style {
        case dynamic   // 활성화 여부에 따라 색상 변경
        case fixed     // 항상 활성화된 민트색 버튼
    }
    
    // MARK: - Properties
    
    private var style: Style = .dynamic
    var tapAction: (() -> Void)?
    
    // MARK: - UI Components
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .pretendard(.head_b_18)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.backgroundColor = .baeminGray200
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        addSubview(button)
    }
    
    private func setupLayout() {
        button.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func setupAction() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func buttonTapped() {
        tapAction?()
    }
    
    // MARK: - Public Methods
    
    func configure(
        title: String,
        style: Style = .dynamic,
        tapAction: (() -> Void)? = nil
    ) {
        self.style = style
        self.tapAction = tapAction
        button.setTitle(title, for: .normal)
        
        switch style {
        case .dynamic:
            button.backgroundColor = .baeminGray200
            button.isEnabled = false
        case .fixed:
            button.backgroundColor = .baeminMint500
            button.isEnabled = true
        }
    }
    
    func setEnabled(_ isEnabled: Bool) {
        guard style == .dynamic else { return }
        button.isEnabled = isEnabled
        button.backgroundColor = isEnabled ? .baeminMint500 : .baeminGray200
    }
}
