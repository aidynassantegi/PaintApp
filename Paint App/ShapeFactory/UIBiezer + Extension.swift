//
//  UIBiezer + Extension.swift
//  Paint App
//
//  Created by Aidyn Assan on 29.06.2022.
//

import UIKit

extension UIBezierPath {
    func setup(with color: UIColor, lineWidth: CGFloat, isFilled: Bool) {
        color.setStroke()
        if isFilled {
            color.setFill()
            fill()
        }
        self.lineWidth = lineWidth
    }
}
