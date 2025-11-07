//
//  HomeModel.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import Foundation

enum HomeSection {
    case category([HomeCategoryModel])
    case mart([HomeMartModel])
    case orderInfo([HomeOrderInfoModel])
    case storeInfo([HomeStoreInfoModel])
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
}

struct HomeMartModel {
    let title: String
}

struct HomeOrderInfoModel {
    let storeName: String
    let rating: Double
    let reviewCount: Int
    let menuName: String
    let discountRate: Int
    let price: Int
    let originalPrice: Int   
}

struct HomeStoreInfoModel {
    let storeName: String
    let rating: Double
    let reviewCount: Int
    let deliveryTime: String
}

struct HomeDiscountStoreModel {
    let storeName: String
    let rating: Double
    let reviewCount: Int
    let deliveryTime: String
}
