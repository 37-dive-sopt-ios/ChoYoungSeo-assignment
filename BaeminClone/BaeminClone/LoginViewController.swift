//
//  LoginViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: BaseViewController {
    
    // MARK: - Delegate
    
    weak var delegate: LoginViewDelegate?
    
    protocol LoginViewDelegate: AnyObject {
        func loginViewController(_ controller: LoginViewController, didLoginWith userID: String)
    }
    
    // MARK: - UI Components

    private let navigationBar = NavigationBar(title: "이메일 또는 아이디로 계속")

    private let idTextField = UITextField().then {
        $0.setPlaceholder("이메일 아이디", color: .baeminGray700, font: .pretendard(.body_r_14))
        $0.font = .pretendard(.body_r_14)
        $0.backgroundColor = .white
        $0.borderStyle = .none
        $0.layer.cornerRadius = 4
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminGray200.cgColor
        $0.setPadding(10)
    }

    private lazy var idClearButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_clear"), for: .normal)
        $0.tintColor = .baeminGray300
    }

    private let pwTextField = UITextField().then {
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

    private lazy var pwClearButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_clear"), for: .normal)
        $0.tintColor = .baeminGray300
    }

    private lazy var toggleSecureButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_eye_slash"), for: .normal)
        $0.tintColor = .baeminGray300
    }

    private let loginButton = CTAButton()

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
        
        idTextField.delegate = self
        pwTextField.delegate = self

        idClearButton.isHidden = true
        pwClearButton.isHidden = true
        toggleSecureButton.isHidden = true
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        idClearButton.addTarget(self, action: #selector(clearIDTextField), for: .touchUpInside)
        pwClearButton.addTarget(self, action: #selector(clearPWTextField), for: .touchUpInside)
        toggleSecureButton.addTarget(self, action: #selector(toggleSecure), for: .touchUpInside)
        
        loginButton.configure(
            title: "로그인",
            style: .dynamic,
            tapAction: { [weak self] in self?.loginButtonTapped() }
        )
    }
    
    override func setLayout() {
        
        findAccountStackView.addArrangedSubviews(findAccountLabel, findAccountImageView)
        
        view.addSubviews(
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
    
    // MARK: - Actions

    @objc
    private func textFieldDidChange() {
        let isEnabled = !(idTextField.text?.isEmpty ?? true)
                     && !(pwTextField.text?.isEmpty ?? true)
        loginButton.setEnabled(isEnabled)
    }

    @objc
    private func clearIDTextField() {
        idTextField.text = ""
        textFieldDidChange()
    }

    @objc
    private func clearPWTextField() {
        pwTextField.text = ""
        textFieldDidChange()
    }

    @objc
    private func toggleSecure() {
        pwTextField.isSecureTextEntry.toggle()
    }
    
    private func loginButtonTapped() {
        view.endEditing(true)

        guard let idText = idTextField.text, !idText.isEmpty else { return }
        guard let pwText = pwTextField.text, !pwText.isEmpty else { return }

        // 비밀번호 정규식 검사
        guard pwText.isValidPassword else {
            passwordAlert()
            return
        }

        let welcomeVC = WelcomeViewController()
        welcomeVC.userID = idText
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    // MARK: - Private Methods

    private func passwordAlert() {
        let alert = UIAlertController(
            title: nil,
            message: "비밀번호는 8~20자이며, 영문, 숫자, 특수문자를 모두 포함해야 합니다.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Extension

extension LoginViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextField.setPlaceholder("이메일 또는 아이디를 입력해주세요", color: .baeminGray700, font: .pretendard(.body_r_14))

            idTextField.layer.borderWidth = 2
            idTextField.layer.borderColor = UIColor.baeminBlack.cgColor
            
            idClearButton.isHidden = false
            pwClearButton.isHidden = true
            toggleSecureButton.isHidden = true

        } else if textField == pwTextField {
            pwTextField.setPlaceholder("비밀번호를 입력해주세요", color: .baeminGray700, font: .pretendard(.body_r_14))

            pwTextField.layer.borderWidth = 2
            pwTextField.layer.borderColor = UIColor.baeminBlack.cgColor
            
            idClearButton.isHidden = true
            pwClearButton.isHidden = false
            toggleSecureButton.isHidden = false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        idTextField.setPlaceholder("이메일 아이디", color: .baeminGray700, font: .pretendard(.body_r_14))
        pwTextField.setPlaceholder("비밀번호", color: .baeminGray700, font: .pretendard(.body_r_14))

        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor

        idClearButton.isHidden = true
        pwClearButton.isHidden = true
        toggleSecureButton.isHidden = true
    }
}
