//
//  UITextField+Padding.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

extension UITextField {
    func setPadding(_ padding: CGFloat) {
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = leftPadding
        self.leftViewMode = .always

        let rightPadding = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.rightView = rightPadding
        self.rightViewMode = .unlessEditing
    }
}
