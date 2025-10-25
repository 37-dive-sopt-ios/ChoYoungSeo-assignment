//
//  BaseViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    func setUI() {}
    func setLayout() {}
}
