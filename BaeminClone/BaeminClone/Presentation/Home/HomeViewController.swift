//
//  HomeViewController.swift
//  BaeminClone
//
//  Created by 조영서 on 11/1/25.
//

import UIKit
import SnapKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let homeView = HomeView()
    private let sections = HomeSection.dummy
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViews()
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        view.addSubview(homeView)
    }
    
    override func setLayout() {
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupCollectionViews() {
        // ✅ 카테고리 뷰
        let categoryCollectionView = homeView.categoryView.collectionView
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(
            HomeCategoryCell.self,
            forCellWithReuseIdentifier: HomeCategoryCell.reuseIdentifier
        )
        
        // ✅ 마트 뷰
        let martCollectionView = homeView.martView.collectionView
        martCollectionView.dataSource = self
        martCollectionView.register(
            HomeCategoryCell.self,
            forCellWithReuseIdentifier: HomeCategoryCell.reuseIdentifier
        )
        
        // ✅ 우리 동네 랭킹 뷰
        let rankingCollectionView = homeView.localRankingView.collectionView
        rankingCollectionView.dataSource = self
        rankingCollectionView.register(
            HomeOrderInfoCell.self,
            forCellWithReuseIdentifier: HomeOrderInfoCell.reuseIdentifier
        )
        
        // ✅ 최근 주문 뷰
        let recentOrderCollectionView = homeView.recentOrderView.collectionView
        recentOrderCollectionView.dataSource = self
        recentOrderCollectionView.register(
            HomeStoreInfoCell.self,
            forCellWithReuseIdentifier: HomeStoreInfoCell.reuseIdentifier
        )
        
        // ✅ 할인 가게 뷰
        let discountStoreCollectionView = homeView.discountStoreView.collectionView
        discountStoreCollectionView.dataSource = self
        discountStoreCollectionView.register(
            HomeStoreInfoCell.self,
            forCellWithReuseIdentifier: HomeStoreInfoCell.reuseIdentifier
        )
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case homeView.categoryView.collectionView:
            if case let .category(models) = sections.first(where: { if case .category = $0 { return true } else { return false } })! {
                return models.count
            }
        case homeView.martView.collectionView:
            if case let .mart(models) = sections.first(where: { if case .mart = $0 { return true } else { return false } })! {
                return models.count
            }
        case homeView.localRankingView.collectionView:
            if case let .orderInfo(models) = sections.first(where: { if case .orderInfo = $0 { return true } else { return false } })! {
                return models.count
            }
        case homeView.recentOrderView.collectionView:
            if case let .storeInfo(models) = sections.first(where: { if case .storeInfo = $0 { return true } else { return false } })! {
                return models.count
            }
        case homeView.discountStoreView.collectionView:
            if case let .discountStore(models) = sections.first(where: { if case .discountStore = $0 { return true } else { return false } })! {
                return models.count
            }
        default:
            return 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            
        // ✅ 카테고리 섹션
        case homeView.categoryView.collectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCategoryCell.reuseIdentifier,
                for: indexPath
            ) as? HomeCategoryCell else { return UICollectionViewCell() }
            
            if case let .category(models) = sections.first(where: { if case .category = $0 { return true } else { return false } })! {
                let model = models[indexPath.item]
                cell.configure(title: model.title, image: model.image)
            }
            return cell
            
        // ✅ 마트
        case homeView.martView.collectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeCategoryCell.reuseIdentifier,
                for: indexPath
            ) as? HomeCategoryCell else { return UICollectionViewCell() }
            
            if case let .mart(models) = sections.first(where: { if case .mart = $0 { return true } else { return false } })! {
                let model = models[indexPath.item]
                cell.configure(title: model.title, image: model.image)
            }
            return cell
            
        // ✅ 우리 동네 랭킹
        case homeView.localRankingView.collectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeOrderInfoCell.reuseIdentifier,
                for: indexPath
            ) as? HomeOrderInfoCell else { return UICollectionViewCell() }
            
            if case let .orderInfo(models) = sections.first(where: { if case .orderInfo = $0 { return true } else { return false } })! {
                let model = models[indexPath.item]
                cell.configure(model)
            }
            return cell
            
        // ✅ 최근 주문
        case homeView.recentOrderView.collectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeStoreInfoCell.reuseIdentifier,
                for: indexPath
            ) as? HomeStoreInfoCell else { return UICollectionViewCell() }
            
            if case let .storeInfo(models) = sections.first(where: { if case .storeInfo = $0 { return true } else { return false } })! {
                let model = models[indexPath.item]
                cell.configure(model, type: .recentOrder)
            }
            return cell
            
        // ✅ 할인 가게
        case homeView.discountStoreView.collectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HomeStoreInfoCell.reuseIdentifier,
                for: indexPath
            ) as? HomeStoreInfoCell else { return UICollectionViewCell() }
            
            if case let .discountStore(models) = sections.first(where: { if case .discountStore = $0 { return true } else { return false } })! {
                let model = models[indexPath.item]
                cell.configure(model, type: .discountStore)
            }
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}
