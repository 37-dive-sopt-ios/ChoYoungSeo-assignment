//
//  HomeDummyData.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import Foundation

// MARK: - Category

extension HomeCategoryModel {
    static let sampleData: [HomeCategoryModel] = [
        HomeCategoryModel(title: "한그릇"),
        HomeCategoryModel(title: "치킨"),
        HomeCategoryModel(title: "카페·디저트"),
        HomeCategoryModel(title: "피자"),
        HomeCategoryModel(title: "분식"),
        HomeCategoryModel(title: "고기"),
        HomeCategoryModel(title: "찜·탕"),
        HomeCategoryModel(title: "야식"),
        HomeCategoryModel(title: "패스트푸드"),
        HomeCategoryModel(title: "픽업")
    ]
}

// MARK: - Mart

extension HomeMartModel {
    static let sampleData: [HomeMartModel] = [
        HomeMartModel(title: "B마트"),
        HomeMartModel(title: "CU"),
        HomeMartModel(title: "이마트슈퍼"),
        HomeMartModel(title: "홈플러스"),
        HomeMartModel(title: "GS25"),
        HomeMartModel(title: "이마트"),
        HomeMartModel(title: "코스트코")
    ]
}

// MARK: - OrderInfo

extension HomeOrderInfoModel {
    static let sampleData: [HomeOrderInfoModel] = [
        HomeOrderInfoModel(
            storeName: "백억보쌈제육",
            rating: 5.0,
            reviewCount: 1973,
            menuName: "[든든한 한끼] 보쌈 막국수",
            discountRate: 20,
            price: 9600,
            originalPrice: 12000
        ),
        HomeOrderInfoModel(
            storeName: "명랑핫도그",
            rating: 4.7,
            reviewCount: 842,
            menuName: "(1인) 피자 + 사이드 Set",
            discountRate: 15,
            price: 2550,
            originalPrice: 3000
        ),
        HomeOrderInfoModel(
            storeName: "홍콩반점0410",
            rating: 4.8,
            reviewCount: 1203,
            menuName: "짜장면 + 탕수육 세트",
            discountRate: 10,
            price: 10800,
            originalPrice: 12000
        ),
        HomeOrderInfoModel(
            storeName: "도미노피자",
            rating: 4.9,
            reviewCount: 4512,
            menuName: "포테이토 피자 L + 콜라",
            discountRate: 25,
            price: 17900,
            originalPrice: 23900
        ),
        HomeOrderInfoModel(
            storeName: "BBQ치킨",
            rating: 4.6,
            reviewCount: 3271,
            menuName: "황올 + 치즈볼 세트",
            discountRate: 12,
            price: 17800,
            originalPrice: 20300
        ),
        HomeOrderInfoModel(
            storeName: "신전떡볶이",
            rating: 4.8,
            reviewCount: 2649,
            menuName: "떡볶이 + 튀김 + 순대",
            discountRate: 18,
            price: 7900,
            originalPrice: 9600
        )
    ]
}

// MARK: - StoreInfo

extension HomeStoreInfoModel {
    static let sampleData: [HomeStoreInfoModel] = [
        HomeStoreInfoModel(
            storeName: "홍콩반점",
            rating: 4.8,
            reviewCount: 120,
            deliveryTime: "25~35분"
        ),
        HomeStoreInfoModel(
            storeName: "죠스떡볶이",
            rating: 4.7,
            reviewCount: 321,
            deliveryTime: "20~30분"
        ),
        HomeStoreInfoModel(
            storeName: "BBQ치킨",
            rating: 4.9,
            reviewCount: 842,
            deliveryTime: "30~40분"
        ),
        HomeStoreInfoModel(
            storeName: "본도시락",
            rating: 4.8,
            reviewCount: 1912,
            deliveryTime: "20~30분"
        ),
        HomeStoreInfoModel(
            storeName: "홍춘천치즈닭갈비",
            rating: 4.7,
            reviewCount: 724,
            deliveryTime: "30~40분"
        ),
        HomeStoreInfoModel(
            storeName: "도미노피자",
            rating: 4.9,
            reviewCount: 2876,
            deliveryTime: "25~35분"
        )
    ]
}

// MARK: - DiscountStore

extension HomeDiscountStoreModel {
    static let sampleData: [HomeDiscountStoreModel] = [
        HomeDiscountStoreModel(
            storeName: "홍콩반점",
            rating: 4.8,
            reviewCount: 120,
            deliveryTime: "25~35분"
        ),
        HomeDiscountStoreModel(
            storeName: "죠스떡볶이",
            rating: 4.7,
            reviewCount: 321,
            deliveryTime: "20~30분"
        ),
        HomeDiscountStoreModel(
            storeName: "BBQ치킨",
            rating: 4.9,
            reviewCount: 1842,
            deliveryTime: "30~40분"
        ),
        HomeDiscountStoreModel(
            storeName: "맘스터치",
            rating: 4.6,
            reviewCount: 2761,
            deliveryTime: "25~35분"
        ),
        HomeDiscountStoreModel(
            storeName: "부엉이돈까스",
            rating: 4.9,
            reviewCount: 893,
            deliveryTime: "20~30분"
        ),
        HomeDiscountStoreModel(
            storeName: "한솥도시락",
            rating: 4.8,
            reviewCount: 3512,
            deliveryTime: "15~25분"
        )
    ]
}

extension HomeSection {
    static var dummy: [HomeSection] {
        [
            .mart(HomeMartModel.sampleData),
            .category(HomeCategoryModel.sampleData),
            .orderInfo(HomeOrderInfoModel.sampleData),
            .storeInfo(HomeStoreInfoModel.sampleData),
            .discountStore(HomeDiscountStoreModel.sampleData)
        ]
    }
}
