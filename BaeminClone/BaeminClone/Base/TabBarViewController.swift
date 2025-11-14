//
//  TabBarViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 11/10/25.
//

import UIKit
import SnapKit

final class TabBarViewController: UIViewController {
    
    // MARK: - Properties
    
    private var currentViewController: UIViewController?
    
    private let viewControllers: [UIViewController] = [
        HomeViewController(),
        UIViewController().then { $0.view.backgroundColor = .red },
        UIViewController().then { $0.view.backgroundColor = .orange },
        UIViewController().then { $0.view.backgroundColor = .yellow },
        UIViewController().then { $0.view.backgroundColor = .green }
    ]
    
    // MARK: - UI Components
    
    private let contentView = UIView()
    
    private let tabBarStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
    }
    
    private let homeStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 5
    }
    
    let homeButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_home"), for: .normal)
    }
    
    private let homeLabel = UILabel().then {
        $0.text = "홈"
        $0.font = .pretendard(.title_sb_10)
        $0.textColor = .baeminBlack
        $0.textAlignment = .center
    }
    
    private let shoppingStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 5
    }
    
    let shoppingButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_shopping"), for: .normal)
    }
    
    private let shoppingLabel = UILabel().then {
        $0.text = "장보기·쇼핑"
        $0.font = .pretendard(.body_r_10)
        $0.textColor = .baeminGray700
        $0.textAlignment = .center
    }
    
    private let favoriteStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 5
    }
    
    let favoriteButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_heart"), for: .normal)
    }
    
    private let favoriteLabel = UILabel().then {
        $0.text = "찜"
        $0.font = .pretendard(.body_r_10)
        $0.textColor = .baeminGray700
        $0.textAlignment = .center
    }
    
    private let orderHistoryStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 5
    }
    
    let orderHistoryButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_order"), for: .normal)
    }
    
    private let orderHistoryLabel = UILabel().then {
        $0.text = "주문내역"
        $0.font = .pretendard(.body_r_10)
        $0.textColor = .baeminGray700
        $0.textAlignment = .center
    }
    
    private let myBaeminStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 5
    }
    
    let myBaeminButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "ic_face"), for: .normal)
    }
    
    private let myBaeminLabel = UILabel().then {
        $0.text = "마이배민"
        $0.font = .pretendard(.body_r_10)
        $0.textColor = .baeminGray700
        $0.textAlignment = .center
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        setupActions()
        switchToTab(index: 0)
    }
    
    // MARK: - Setup Methods
    
    func setUI() {
        view.addSubview(contentView)
        
        homeStackView.addArrangedSubviews(homeButton, homeLabel)
        shoppingStackView.addArrangedSubviews(shoppingButton, shoppingLabel)
        favoriteStackView.addArrangedSubviews(favoriteButton, favoriteLabel)
        orderHistoryStackView.addArrangedSubviews(orderHistoryButton, orderHistoryLabel)
        myBaeminStackView.addArrangedSubviews(myBaeminButton, myBaeminLabel)
        
        tabBarStackView.addArrangedSubviews(
            homeStackView,
            shoppingStackView,
            favoriteStackView,
            orderHistoryStackView,
            myBaeminStackView
        )
        
        view.addSubview(tabBarStackView)
    }
    
    func setLayout() {
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBarStackView.snp.top)
        }
        
        tabBarStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        [homeButton, shoppingButton, favoriteButton, orderHistoryButton, myBaeminButton].forEach {
            $0.snp.makeConstraints{ $0.size.equalTo(24) }
        }
    }
    
    // MARK: - Setup Actions
    
    private func setupActions() {
        let buttons = [homeButton, shoppingButton, favoriteButton, orderHistoryButton, myBaeminButton]
        for (index, button) in buttons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    // MARK: - Actions
    
    @objc private func tabButtonTapped(_ sender: UIButton) {
        switchToTab(index: sender.tag)
    }
    
    // MARK: - Private Methods
    
    private func switchToTab(index: Int) {

        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        
        let newVC = viewControllers[index]
        addChild(newVC)
        contentView.addSubview(newVC.view)
        newVC.view.snp.makeConstraints { $0.edges.equalToSuperview() }
        newVC.didMove(toParent: self)
        currentViewController = newVC
        
        let buttons = [homeButton, shoppingButton, favoriteButton, orderHistoryButton, myBaeminButton]
        let labels = [homeLabel, shoppingLabel, favoriteLabel, orderHistoryLabel, myBaeminLabel]
        
        let normalIcons = ["ic_home", "ic_shopping", "ic_heart", "ic_order", "ic_face"]
        let fillIcons = ["ic_home_fill", "ic_shopping_fill", "ic_heart_fill", "ic_order_fill", "ic_face_fill"]
        
        for (i, button) in buttons.enumerated() {
            let isSelected = (i == index)
            let iconName = isSelected ? fillIcons[i] : normalIcons[i]
            button.setImage(UIImage(named: iconName), for: .normal)
            labels[i].textColor = isSelected ? .baeminBlack : .baeminGray700
        }
    }
}
