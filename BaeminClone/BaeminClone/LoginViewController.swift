//
//  LoginViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit
import SnapKit

final class LoginViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 아이디"
        textField.font = UIFont(name: "Pretendard-Regular", size: 17)
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.grey200.cgColor
        textField.setPadding(10)
        return textField
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-Regular", size: 17)
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.grey200.cgColor
        textField.setPadding(10)
        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.backgroundColor = .grey300
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let findAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()

    private let findAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "계정 찾기"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()

    private let findAccountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "character_profile")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Setup Methods
    
    override func setUI() {
        view.backgroundColor = .white
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func setLayout() {
        findAccountStackView.addArrangedSubviews(findAccountLabel, findAccountImageView)
        view.addSubviews(idTextField, pwTextField, loginButton, findAccountStackView)
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(300)

        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(300)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(300)
        }
        
        findAccountStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        findAccountImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 20, height: 20))
        }
    }
    
    // MARK: - Actions

    @objc
    private func textFieldDidChange() {
        let isEnabled = !(idTextField.text?.isEmpty ?? true) && !(pwTextField.text?.isEmpty ?? true)
        loginButton.isEnabled = isEnabled
        loginButton.backgroundColor = isEnabled ? .black : .grey300
    }
}

#Preview {
    LoginViewController()
}
