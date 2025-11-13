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
        $0.setImage(UIImage(named: "ic_home")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .baeminBlack
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
        $0.setImage(UIImage(named: "ic_shopping")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .baeminGray700
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
        $0.setImage(UIImage(named: "ic_heart")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .baeminGray700
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
        $0.setImage(UIImage(named: "ic_order")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .baeminGray700
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
        $0.setImage(UIImage(named: "ic_face")?.withRenderingMode(.alwaysTemplate), for: .normal)
        $0.tintColor = .baeminGray700
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
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(6)
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
        // 이전 화면 제거
        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        
        // 새로운 화면 추가
        let newVC = viewControllers[index]
        addChild(newVC)
        contentView.addSubview(newVC.view)
        newVC.view.frame = contentView.bounds
        newVC.didMove(toParent: self)
        currentViewController = newVC
        
        // 탭 색상 업데이트
        let buttons = [homeButton, shoppingButton, favoriteButton, orderHistoryButton, myBaeminButton]
        let labels = [homeLabel, shoppingLabel, favoriteLabel, orderHistoryLabel, myBaeminLabel]
        
        for (i, button) in buttons.enumerated() {
            let isSelected = (i == index)
            button.tintColor = isSelected ? .baeminBlack : .baeminGray700
            labels[i].textColor = isSelected ? .baeminBlack : .baeminGray700
        }
    }
}
