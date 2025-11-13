//
//  UITextField+.swift
//  BaeminClone
//
//  Created by 조영서 on 10/25/25.
//

import UIKit

extension UITextField {
    
    func leftPadding(_ padding: CGFloat) {
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = leftPadding
        self.leftViewMode = .always
    }
    
    func rightPadding(_ padding: CGFloat) {
        let rightPadding = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.rightView = rightPadding
        self.rightViewMode = .unlessEditing
    }
    
    func setPlaceholder(_ text: String, color: UIColor, font: UIFont? = nil) {
        var attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        
        if let font = font {
            attributes[.font] = font
        }
        
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: attributes
        )
    }
}
