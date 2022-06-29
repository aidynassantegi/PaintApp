//
//  TriangleFactory.swift
//  Paint App
//
//  Created by Aidyn Assan on 29.06.2022.
//

import UIKit

final class TriangleFactory: ShapeFactory {
    func create(configuration: ShapeConfiguration) -> UIBezierPath {
        let path = UIBezierPath()
        let middlePoint = CGPoint(x: configuration.startPoint.x, y: configuration.endPoint.y)
        path.move(to: configuration.startPoint)
        path.addLine(to: middlePoint)
        path.addLine(to: configuration.endPoint)
        path.close()
        
        path.setup(with: configuration.color,
                   lineWidth: configuration.lineWidth,
                   isFilled: configuration.isFilled)
        
        return path
    }
}
