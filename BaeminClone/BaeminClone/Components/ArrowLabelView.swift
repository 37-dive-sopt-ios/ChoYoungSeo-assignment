//
//  ArrowLabelView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class ArrowLabelView: UIView {
    
    // MARK: - UI Components
    
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 4
    }
    
    private let label = UILabel().then {
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let iconImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_chevron_right")
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        addSubview(stackView)
        stackView.addArrangedSubviews(label, iconImageView)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(12)
        }
    }
    
    // MARK: - Public Methods
    
    func configure(text: String, boldText: String? = nil) {
        let attributed = NSMutableAttributedString(
            string: text,
            attributes: [
                .font: UIFont.pretendard(.body_r_14),
                .foregroundColor: UIColor.baeminBlack
            ]
        )
        
        if let boldText = boldText, let range = text.range(of: boldText) {
            let nsRange = NSRange(range, in: text)
            attributed.addAttributes([
                .font: UIFont.pretendard(.head_b_14)
            ], range: nsRange)
        }
        
        label.attributedText = attributed
    }
}
