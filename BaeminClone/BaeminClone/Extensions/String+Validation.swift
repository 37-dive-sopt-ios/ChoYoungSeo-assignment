//
//  String+Validation.swift
//  BaeminClone
//
//  Created by 조영서 on 10/25/25.
//


import Foundation

extension String {
    // 비밀번호 정규식 (영문, 숫자, 특수문자 포함 8~20자)
    var isValidPassword: Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*()_+=-]).{8,20}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
