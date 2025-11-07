//
//  ReuseIdentifiable.swift
//  BaeminClone
//
//  Created by 조영서 on 11/6/25.
//

import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
