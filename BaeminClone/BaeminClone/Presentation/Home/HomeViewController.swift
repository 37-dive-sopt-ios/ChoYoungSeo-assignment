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
    private let martModels = HomeMartModel.sampleData
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
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
    
    private func setupCollectionView() {
        let collectionView = homeView.martView.collectionView
        collectionView.dataSource = self
        collectionView.register(
            HomeCategoryCell.self,
            forCellWithReuseIdentifier: HomeCategoryCell.reuseIdentifier
        )
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return martModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCategoryCell.reuseIdentifier,
            for: indexPath
        ) as? HomeCategoryCell else {
            return UICollectionViewCell()
        }
        
        let model = martModels[indexPath.item]
        cell.configure(title: model.title, image: model.image)
        return cell
    }
}
