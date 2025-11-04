//
//  UIFont+.swift
//  BaeminClone
//
//  Created by 조영서 on 10/25/25.
//

import UIKit

extension UIFont {
    enum PretendardStyle {
        case head_b_24
        case head_b_18
        case head_b_16
        case title_sb_18
        case body_r_14
        case caption_r_10
    }

    static func pretendard(_ style: PretendardStyle) -> UIFont {
        switch style {
        case .head_b_24:
            return UIFont(name: "Pretendard-Bold", size: 24) ?? .systemFont(ofSize: 24, weight: .bold)
        case .head_b_18:
            return UIFont(name: "Pretendard-Bold", size: 18) ?? .systemFont(ofSize: 18, weight: .bold)
        case .head_b_16:
            return UIFont(name: "Pretendard-Bold", size: 16) ?? .systemFont(ofSize: 16, weight: .bold)
        case .title_sb_18:
            return UIFont(name: "Pretendard-SemiBold", size: 18) ?? .systemFont(ofSize: 18, weight: .semibold)
        case .body_r_14:
            return UIFont(name: "Pretendard-Regular", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
        case .caption_r_10:
            return UIFont(name: "Pretendard-Regular", size: 10) ?? .systemFont(ofSize: 10, weight: .regular)
        }
    }
}
