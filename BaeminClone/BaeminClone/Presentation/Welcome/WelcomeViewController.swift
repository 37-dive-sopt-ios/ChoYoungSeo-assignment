//
//  WelcomeViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

final class WelcomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    var userID: String?
    private let welcomeView = WelcomeView()
    
    override func loadView() {
        view = welcomeView
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        welcomeView.navigationBar.backAction = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        welcomeView.loginButton.configure(
            title: "뒤로가기",
            style: .fixed,
            tapAction: { [weak self] in
                self?.backToLoginButtonTapped()
            }
        )
        
        if let userID = userID, !userID.isEmpty {
            welcomeView.subtitleLabel.text = "\(userID)님 반가워요!"
        } else {
            welcomeView.subtitleLabel.text = "반가워요!"
        }
    }
    
    // MARK: - Actions
    
    private func backToLoginButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
