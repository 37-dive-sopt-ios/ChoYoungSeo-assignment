//
//  LoginViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let loginView = LoginView()
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginView.idTextField.text = ""
        loginView.pwTextField.text = ""
        loginView.loginButton.setEnabled(false)
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        view.addSubview(loginView)
        
        loginView.navigationBar.backAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        loginView.idTextField.delegate = self
        loginView.pwTextField.delegate = self
        
        loginView.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginView.pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        loginView.idClearButton.addTarget(self, action: #selector(clearIDTextField), for: .touchUpInside)
        loginView.pwClearButton.addTarget(self, action: #selector(clearPWTextField), for: .touchUpInside)
        loginView.toggleSecureButton.addTarget(self, action: #selector(toggleSecure), for: .touchUpInside)
        
        loginView.loginButton.configure(
            title: "로그인",
            style: .dynamic,
            tapAction: { [weak self] in self?.loginButtonTapped() }
        )
    }
    
    override func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func textFieldDidChange() {
        let isEnabled = !(loginView.idTextField.text?.isEmpty ?? true)
                      && !(loginView.pwTextField.text?.isEmpty ?? true)
        loginView.loginButton.setEnabled(isEnabled)
    }

    @objc private func clearIDTextField() {
        loginView.idTextField.text = ""
        textFieldDidChange()
    }

    @objc private func clearPWTextField() {
        loginView.pwTextField.text = ""
        textFieldDidChange()
    }

    @objc private func toggleSecure() {
        loginView.pwTextField.isSecureTextEntry.toggle()
    }
    
    private func loginButtonTapped() {
        view.endEditing(true)

        guard let idText = loginView.idTextField.text, !idText.isEmpty else { return }
        guard let pwText = loginView.pwTextField.text, !pwText.isEmpty else { return }

        guard pwText.isValidPassword else {
            passwordAlert()
            return
        }

        let welcomeVC = WelcomeViewController()
        welcomeVC.userID = idText
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    private func passwordAlert() {
        let alert = UIAlertController(
            title: nil,
            message: "비밀번호는 8~20자이며, 영문, 숫자, 특수문자를 모두 포함해야 합니다.",
            preferredStyle: .alert
        )
        alert.addAction(.init(title: "확인", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let idField = loginView.idTextField
        let pwField = loginView.pwTextField
        
        if textField == idField {
            idField.setPlaceholder("이메일 또는 아이디를 입력해주세요", color: .baeminGray700, font: .pretendard(.body_r_14))
            idField.layer.borderWidth = 2
            idField.layer.borderColor = UIColor.baeminBlack.cgColor
            loginView.idClearButton.isHidden = false
            loginView.pwClearButton.isHidden = true
            loginView.toggleSecureButton.isHidden = true
        } else if textField == pwField {
            pwField.setPlaceholder("비밀번호를 입력해주세요", color: .baeminGray700, font: .pretendard(.body_r_14))
            pwField.layer.borderWidth = 2
            pwField.layer.borderColor = UIColor.baeminBlack.cgColor
            loginView.idClearButton.isHidden = true
            loginView.pwClearButton.isHidden = false
            loginView.toggleSecureButton.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        loginView.idTextField.setPlaceholder("이메일 아이디", color: .baeminGray700, font: .pretendard(.body_r_14))
        loginView.pwTextField.setPlaceholder("비밀번호", color: .baeminGray700, font: .pretendard(.body_r_14))
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        
        loginView.idClearButton.isHidden = true
        loginView.pwClearButton.isHidden = true
        loginView.toggleSecureButton.isHidden = true
    }
}
