//
//  LoginView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit
import Then

final class LoginView: BaseUIView {
    
    // MARK: - UI Components

    let navigationBar = NavigationBar(title: "이메일 또는 아이디로 계속")
    
    let idTextField = UITextField().then {
        $0.setPlaceholder("이메일 아이디", color: .baeminGray700, font: .pretendard(.body_r_14))
        $0.font = .pretendard(.body_r_14)
        $0.backgroundColor = .white
        $0.borderStyle = .none
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminGray200.cgColor
        $0.setPadding(10)
    }
    
    let idClearButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_clear"), for: .normal)
        $0.tintColor = .baeminGray300
        $0.isHidden = true
    }
    
    let pwTextField = UITextField().then {
        $0.setPlaceholder("비밀번호", color: .baeminGray700, font: .pretendard(.body_r_14))
        $0.font = .pretendard(.body_r_14)
        $0.backgroundColor = .white
        $0.borderStyle = .none
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminGray200.cgColor
        $0.isSecureTextEntry = true
        $0.setPadding(10)
    }
    
    let pwClearButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_clear"), for: .normal)
        $0.tintColor = .baeminGray300
        $0.isHidden = true
    }
    
    let toggleSecureButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_eye_slash"), for: .normal)
        $0.tintColor = .baeminGray300
        $0.isHidden = true
    }
    
    let loginButton = CTAButton()
    
    private let findAccountStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 4
    }
    
    private let findAccountLabel = UILabel().then {
        $0.text = "계정 찾기"
        $0.font = .pretendard(.body_r_14)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let findAccountImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_chevron_right")
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        findAccountStackView.addArrangedSubviews(findAccountLabel, findAccountImageView)
    }
    
    override func setLayout() {
        addSubviews(
            navigationBar,
            idTextField,
            idClearButton,
            pwTextField,
            pwClearButton,
            toggleSecureButton,
            loginButton,
            findAccountStackView
        )
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(46)
            $0.width.equalTo(343)
        }
        
        idClearButton.snp.makeConstraints {
            $0.centerY.equalTo(idTextField)
            $0.trailing.equalTo(idTextField.snp.trailing).inset(15)
            $0.size.equalTo(24)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(46)
            $0.width.equalTo(343)
        }
        
        pwClearButton.snp.makeConstraints {
            $0.centerY.equalTo(pwTextField)
            $0.trailing.equalTo(pwTextField.snp.trailing).inset(15)
            $0.size.equalTo(24)
        }
        
        toggleSecureButton.snp.makeConstraints {
            $0.centerY.equalTo(pwTextField)
            $0.trailing.equalTo(pwClearButton.snp.leading).offset(-12)
            $0.size.equalTo(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(46)
            $0.width.equalTo(343)
        }
        
        findAccountStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        findAccountImageView.snp.makeConstraints {
            $0.size.equalTo(12)
        }
    }
}
