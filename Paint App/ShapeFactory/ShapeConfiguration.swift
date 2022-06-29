//
//  ShapeConfiguration.swift
//  Paint App
//
//  Created by Aidyn Assan on 29.06.2022.
//

import UIKit

protocol ShapeFactory {
    func create(configuration: ShapeConfiguration) -> UIBezierPath
}

enum ShapeType {
    case circle
    case rectangle
    case line
    case triangle
    case pencil
    
    var factory: ShapeFactory {
        switch self {
        case .circle:
            return CircleFactory()
        case .rectangle:
            return RectangleFactory()
        case .line:
            return LineFactory()
        case .triangle:
            return TriangleFactory()
        case .pencil:
            return LineFactory()
        }
    }
}

struct ShapeConfiguration {
    let startPoint: CGPoint
    let endPoint: CGPoint
    let isFilled: Bool
    let lineWidth: CGFloat = 2.0
    let color: UIColor
}
