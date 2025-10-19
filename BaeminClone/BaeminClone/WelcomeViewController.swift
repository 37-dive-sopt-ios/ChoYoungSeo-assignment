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
    
    private let findAccountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "character_profile")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let findAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "ㅇㅇ님 반가워요!"
        label.font = UIFont(name: "Pretendard-Regular", size: 15)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    // MARK: - Setup Methods
    
    override func setUI() {
        view.backgroundColor = .white
    }
    
    override func setLayout() {
        view.addSubviews(findAccountImageView, findAccountLabel, loginButton)
        
        findAccountImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.3)
            $0.width.equalToSuperview()

        }
        
        findAccountLabel.snp.makeConstraints {
            $0.top.equalTo(findAccountImageView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(102)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(findAccountLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(52)
            $0.width.equalTo(300)
        }
    }
}

#Preview {
    WelcomeViewController()
}
