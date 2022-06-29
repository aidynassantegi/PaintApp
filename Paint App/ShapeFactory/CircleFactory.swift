//
//  CircleFactory.swift
//  Paint App
//
//  Created by Aidyn Assan on 29.06.2022.
//

import UIKit

final class CircleFactory: ShapeFactory {
    func create(configuration: ShapeConfiguration) -> UIBezierPath {
        let rect = CGRect(x: configuration.startPoint.x,
                          y: configuration.startPoint.y,
                          width: configuration.endPoint.x - configuration.startPoint.x,
                          height: configuration.endPoint.y - configuration.startPoint.y)
        let path = UIBezierPath(ovalIn: rect)

        path.setup(with: configuration.color,
                   lineWidth: configuration.lineWidth,
                   isFilled: configuration.isFilled)
        
        return path
    }
}
