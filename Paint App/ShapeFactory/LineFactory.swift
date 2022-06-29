//
//  LineFactory.swift
//  Paint App
//
//  Created by Aidyn Assan on 29.06.2022.
//

import UIKit

final class LineFactory: ShapeFactory {
    func create(configuration: ShapeConfiguration) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: configuration.startPoint)
        path.addLine(to: configuration.endPoint)
        path.setup(with: configuration.color,
                   lineWidth: configuration.lineWidth,
                   isFilled: configuration.isFilled)
        return path
    }
}
