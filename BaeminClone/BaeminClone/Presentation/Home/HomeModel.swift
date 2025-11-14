//
//  HomeModel.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import UIKit

enum HomeSection {
    case category([HomeCategoryModel])
    case mart([HomeMartModel])
    case orderInfo([HomeOrderInfoModel])
    case storeInfo([HomeRecentOrderModel])
    case discountStore([HomeDiscountStoreModel])
}

extension HomeSection {
    var itemCount: Int {
        switch self {
        case let .category(models):
            return models.count
        case let .mart(models):
            return models.count
        case let .orderInfo(models):
            return models.count
        case let .storeInfo(models):
            return models.count
        case let .discountStore(models):
            return models.count
        }
    }
}

// MARK: - Models

struct HomeCategoryModel {
    let title: String
    let image: UIImage?
}

struct HomeMartModel {
    let title: String
    let image: UIImage?
}

struct HomeOrderInfoModel {
    let image: UIImage?
    let storeName: String
    let rating: Double
    let reviewCount: Int?
    let menuName: String
    let discountRate: Int
    let price: Int
    let originalPrice: Int
}

struct HomeRecentOrderModel {
    let image: UIImage?
    let storeName: String
    let rating: Double
    let reviewCount: Int
    let deliveryTime: String
}

struct HomeDiscountStoreModel {
    let image: UIImage?
    let storeName: String
    let rating: Double
    let reviewCount: Int
    let deliveryTime: String
}
