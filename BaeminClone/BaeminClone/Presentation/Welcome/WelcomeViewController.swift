//
//  WelcomeViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    var userID: String?
    
    // MARK: - UI Components

    private let navigationBar = NavigationBar(title: "로그인 완료")

    private let welcomeImageView = UIImageView().then {
        $0.image = UIImage(named: "img_welcome")
        $0.contentMode = .scaleAspectFit
    }

    private let titleLabel = UILabel().then {
        $0.text = "환영합니다"
        $0.font = .pretendard(.head_b_24)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }

    private let subtitleLabel = UILabel().then {
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    private let loginButton = CTAButton()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        navigationBar.backAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        loginButton.configure(
            title: "뒤로가기",
            style: .fixed,
            tapAction: { [weak self] in
                self?.backToLoginButtonTapped()
            }
        )
        
        if let userID = userID, !userID.isEmpty {
            subtitleLabel.text = "\(userID)님 반가워요!"
        } else {
            subtitleLabel.text = "반가워요!"
        }
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
    
    // MARK: - Actions
    
    private func backToLoginButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
