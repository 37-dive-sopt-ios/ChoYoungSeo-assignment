//
//  BaseViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Setup Methods
    func setUI() {}
    func setLayout() {}
}
