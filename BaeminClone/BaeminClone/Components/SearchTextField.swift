//
//  SearchTextField.swift
//  BaeminClone
//
//  Created by 조영서 on 11/5/25.
//

import UIKit
import SnapKit
import Then

final class SearchTextField: UIView {
    
    // MARK: - UI Components
    
    private let searchTextField = UITextField().then {
        $0.font = .pretendard(.body_r_14)
        $0.backgroundColor = .white
        $0.borderStyle = .none
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminBlack.cgColor
        $0.leftPadding(17)
        $0.rightPadding(45)
    }
    
    private let searchButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .baeminGray700
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
        addSubviews(searchTextField, searchButton)
    }
    
    private func setupLayout() {
        searchTextField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.trailing.equalToSuperview().inset(17)
            $0.size.equalTo(24)
        }
    }
    
    // MARK: - Public Methods
    
    func configure(placeholder: String) {
        searchTextField.setPlaceholder(
            placeholder,
            color: .baeminGray300,
            font: .pretendard(.body_r_14)
        )
    }
}
