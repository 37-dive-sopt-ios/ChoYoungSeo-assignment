//
//  HomeDummyData.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import UIKit

// MARK: - Category

extension HomeCategoryModel {
    static let sampleData: [HomeCategoryModel] = [
        HomeCategoryModel(title: "한그릇", image: UIImage(named: "img_category_1")),
        HomeCategoryModel(title: "치킨", image: UIImage(named: "img_category_2")),
        HomeCategoryModel(title: "카페·디저트", image: UIImage(named: "img_category_3")),
        HomeCategoryModel(title: "피자", image: UIImage(named: "img_category_4")),
        HomeCategoryModel(title: "분식", image: UIImage(named: "img_category_5")),
        HomeCategoryModel(title: "고기", image: UIImage(named: "img_category_6")),
        HomeCategoryModel(title: "찜·탕", image: UIImage(named: "img_category_7")),
        HomeCategoryModel(title: "야식", image: UIImage(named: "img_category_8")),
        HomeCategoryModel(title: "패스트푸드", image: UIImage(named: "img_category_9")),
        HomeCategoryModel(title: "픽업", image: UIImage(named: "img_category_10"))
    ]
}

// MARK: - Mart

extension HomeMartModel {
    static let sampleData: [HomeMartModel] = [
        HomeMartModel(title: "B마트", image: UIImage(named: "img_mart_1")),
        HomeMartModel(title: "CU", image: UIImage(named: "img_mart_2")),
        HomeMartModel(title: "이마트슈퍼", image: UIImage(named: "img_mart_3")),
        HomeMartModel(title: "홈플러스", image: UIImage(named: "img_mart_4")),
        HomeMartModel(title: "GS25", image: UIImage(named: "img_mart_5")),
        HomeMartModel(title: "이마트", image: UIImage(named: "img_mart_6")),
        HomeMartModel(title: "코스트코", image: UIImage(named: "img_mart_7"))
    ]
}

// MARK: - OrderInfo

extension HomeOrderInfoModel {
    static let sampleData: [HomeOrderInfoModel] = [
        HomeOrderInfoModel(
            image: UIImage(named: "img_bossam"),
            storeName: "백억보쌈제육",
            rating: 5.0,
            reviewCount: 1973,
            menuName: "[든든한 한끼] 보쌈 막국수",
            discountRate: 20,
            price: 9600,
            originalPrice: 12000
        ),
        HomeOrderInfoModel(
            image: UIImage(named: "img_hotdog"),
            storeName: "명랑핫도그",
            rating: 4.7,
            reviewCount: 842,
            menuName: "(1인) 피자 + 사이드 Set",
            discountRate: 15,
            price: 2550,
            originalPrice: 3000
        ),
        HomeOrderInfoModel(
            image: UIImage(named: "img_hongkongbanjum"),
            storeName: "홍콩반점0410",
            rating: 4.8,
            reviewCount: 1203,
            menuName: "짜장면 + 탕수육 세트",
            discountRate: 10,
            price: 10800,
            originalPrice: 12000
        ),
        HomeOrderInfoModel(
            image: UIImage(named: "img_domino"),
            storeName: "도미노피자",
            rating: 4.9,
            reviewCount: 4512,
            menuName: "포테이토 피자 L + 콜라",
            discountRate: 25,
            price: 17900,
            originalPrice: 23900
        ),
        HomeOrderInfoModel(
            image: UIImage(named: "img_bbq"),
            storeName: "BBQ치킨",
            rating: 4.6,
            reviewCount: 3271,
            menuName: "황올 + 치즈볼 세트",
            discountRate: 12,
            price: 17800,
            originalPrice: 20300
        ),
        HomeOrderInfoModel(
            image: UIImage(named: "img_sinjeon"),
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
            image: UIImage(named: "img_hongkongbanjum"),
            storeName: "홍콩반점",
            rating: 4.8,
            reviewCount: 120,
            deliveryTime: "25~35분"
        ),
        HomeStoreInfoModel(
            image: UIImage(named: "img_jaws"),
            storeName: "죠스떡볶이",
            rating: 4.7,
            reviewCount: 321,
            deliveryTime: "20~30분"
        ),
        HomeStoreInfoModel(
            image: UIImage(named: "img_bbq"),
            storeName: "BBQ치킨",
            rating: 4.9,
            reviewCount: 842,
            deliveryTime: "30~40분"
        ),
        HomeStoreInfoModel(
            image: UIImage(named: "img_bondosirak"),
            storeName: "본도시락",
            rating: 4.8,
            reviewCount: 1912,
            deliveryTime: "20~30분"
        ),
        HomeStoreInfoModel(
            image: UIImage(named: "img_hongchuncheon"),
            storeName: "홍춘천치즈닭갈비",
            rating: 4.7,
            reviewCount: 724,
            deliveryTime: "30~40분"
        ),
        HomeStoreInfoModel(
            image: UIImage(named: "img_domino"),
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
            image: UIImage(named: "img_hongkongbanjum"),
            storeName: "홍콩반점",
            rating: 4.8,
            reviewCount: 120,
            deliveryTime: "25~35분"
        ),
        HomeDiscountStoreModel(
            image: UIImage(named: "img_jaws"),
            storeName: "죠스떡볶이",
            rating: 4.7,
            reviewCount: 321,
            deliveryTime: "20~30분"
        ),
        HomeDiscountStoreModel(
            image: UIImage(named: "img_bbq"),
            storeName: "BBQ치킨",
            rating: 4.9,
            reviewCount: 1842,
            deliveryTime: "30~40분"
        ),
        HomeDiscountStoreModel(
            image: UIImage(named: "img_momstouch"),
            storeName: "맘스터치",
            rating: 4.6,
            reviewCount: 2761,
            deliveryTime: "25~35분"
        ),
        HomeDiscountStoreModel(
            image: UIImage(named: "img_bueongi"),
            storeName: "부엉이돈까스",
            rating: 4.9,
            reviewCount: 893,
            deliveryTime: "20~30분"
        ),
        HomeDiscountStoreModel(
            image: UIImage(named: "img_hansot"),
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
