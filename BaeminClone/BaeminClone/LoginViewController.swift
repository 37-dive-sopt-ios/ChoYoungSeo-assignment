//
//  LoginViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit
import SnapKit

final class LoginViewController: BaseViewController {
    
    // MARK: - Delegate
    
    weak var delegate: LoginViewDelegate?
    
    protocol LoginViewDelegate: AnyObject {
        func loginViewController(_ controller: LoginViewController, didLoginWith userID: String)
    }
    
    // MARK: - UI Components
    
    private let navigationBar = NavigationBar(title: "이메일 또는 아이디로 계속")
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 아이디"
        textField.font = .pretendard(.body_r_14)
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.setPadding(10)
        return textField
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = .pretendard(.body_r_14)
        textField.backgroundColor = .white
        textField.borderStyle = .none
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.isSecureTextEntry = true
        textField.setPadding(10)
        return textField
    }()
    
    private let loginButton = CTAButton()
    
    private let findAccountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    private let findAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "계정 찾기"
        label.font = .pretendard(.body_r_14)
        label.textColor = .baeminBlack
        label.textAlignment = .center
        return label
    }()
    
    private let findAccountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_chevron_right")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        idTextField.text = ""
        pwTextField.text = ""
        loginButton.setEnabled(false)
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        navigationBar.backAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        loginButton.configure(
            title: "로그인",
            style: .dynamic,
            tapAction: { [weak self] in self?.loginButtonTapped() }
        )
    }
    
    override func setLayout() {
        
        findAccountStackView.addArrangedSubviews(findAccountLabel, findAccountImageView)
        
        view.addSubviews(navigationBar, idTextField, pwTextField, loginButton, findAccountStackView)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(46)
            $0.width.equalTo(343)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(46)
            $0.width.equalTo(343)
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
    
    // MARK: - Actions
    
    @objc
    private func textFieldDidChange() {
        let isEnabled = !(idTextField.text?.isEmpty ?? true)
                      && !(pwTextField.text?.isEmpty ?? true)
        loginButton.setEnabled(isEnabled)
    }
    
    private func loginButtonTapped() {
        guard let idText = idTextField.text, !idText.isEmpty else { return }

        let welcomeVC = WelcomeViewController()
        welcomeVC.userID = idText
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

//#Preview {
//    LoginViewController()
//}
