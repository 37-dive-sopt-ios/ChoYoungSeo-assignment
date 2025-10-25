//
//  WelcomeViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit
import SnapKit

final class WelcomeViewController: BaseViewController {

    // MARK: - UI Components
    
    private let navigationBar = NavigationBar(title: "로그인 완료")
    
    private let welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_welcome")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.font = .pretendard(.head_b_24)
        label.textColor = .baeminBlack
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "반가워요!"
        label.font = .pretendard(.title_sb_18)
        label.textColor = .baeminBlack
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let loginButton = CTAButton()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        navigationBar.backAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        loginButton.configure(
            title: "로그인하기",
            style: .fixed,
            tapAction: { [weak self] in self?.backToLoginButtonTapped() }
        )
    }
    
    override func setLayout() {
        view.addSubviews(navigationBar, welcomeImageView, titleLabel, subtitleLabel, loginButton)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        welcomeImageView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(48)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(343)
        }
    }
    
    // MARK: - Private Methods
    
    private func backToLoginButtonTapped() {
        let loginVC = LoginViewController()
        loginVC.delegate = self
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

// MARK: - LoginViewDelegate

extension WelcomeViewController: LoginViewController.LoginViewDelegate {
    func loginViewController(_ controller: LoginViewController, didLoginWith userID: String) {
        subtitleLabel.text = "\(userID)님 반가워요!"
    }
}
