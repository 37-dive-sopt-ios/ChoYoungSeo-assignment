//
//  WelcomeView.swift
//  BaeminClone
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit
import Then

final class WelcomeView: BaseUIView {
    
    // MARK: - UI Components

    let navigationBar = NavigationBar(title: "로그인 완료")
    
    let welcomeImageView = UIImageView().then {
        $0.image = UIImage(named: "img_welcome")
        $0.contentMode = .scaleAspectFit
    }

    let titleLabel = UILabel().then {
        $0.text = "환영합니다"
        $0.font = .pretendard(.head_b_24)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }

    let subtitleLabel = UILabel().then {
        $0.font = .pretendard(.title_sb_18)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    let goToHomeButton = CTAButton()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        
        backgroundColor = .white
        
        addSubviews(
            navigationBar,
            welcomeImageView,
            titleLabel,
            subtitleLabel,
            goToHomeButton
        )
    }
    
    override func setLayout() {
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
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
        
        goToHomeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(48)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(343)
        }
    }
}
