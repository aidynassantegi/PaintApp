//
//  Line.swift
//  Paint App
//
//  Created by Aidyn Assan on 14.06.2022.
//

import UIKit

enum ButtonType {
    case circle
    case rectangle
    case line
    case triangle
    case pencil
}

struct Object {
    let color: UIColor
    var points: [(CGPoint, CGPoint)]
    let buttonType: ButtonType
    let isFilled: Bool
}
