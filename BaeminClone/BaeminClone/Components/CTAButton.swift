//
//  CTAButton.swift
//  BaeminClone
//
//  Created by 조영서 on 10/25/25.
//

import UIKit
import SnapKit
import Then

final class CTAButton: UIView {
    
    // MARK: - Enum
    
    enum Style {
        case dynamic
        case fixed
    }
    
    // MARK: - Properties
    
    private var style: Style = .dynamic
    var tapAction: (() -> Void)?
    
    // MARK: - UI Components
    
    private let button = UIButton(type: .system).then {
        $0.titleLabel?.font = .pretendard(.head_b_18)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.backgroundColor = .baeminGray200
    }
    
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
