//
//  Canvas.swift
//  Paint App
//
//  Created by Aidyn Assan on 13.06.2022.
//

import UIKit

class Canvas: UIView {
    private var states: [Momento] = []
    private var shapes: [ShapeViewModel] = []
    var shapeType: ShapeType = .pencil
    var objectColor: UIColor = .black
    var isFilled: Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        savePreviousMoment()
        guard let first = touches.first?.location(in: self) else { return }
        let viewModel = ShapeViewModel(color: objectColor,
                                       points: [(first, CGPoint())],
                                       shapeType: shapeType,
                                       isFilled: isFilled)
        shapes.append(viewModel)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let last = touches.first?.location(in: self) else { return }
        
        guard var lastObject = shapes.popLast() else { return }
        guard var endPoint = lastObject.points.popLast() else { return }
        endPoint.toPoint = last
        lastObject.points.append(endPoint)
        
        if shapeType == .pencil {
            lastObject.points.append((last, last))
        }
        shapes.append(lastObject)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        shapes.forEach { shape in
            shape.color.setStroke()
            
            shape.points.forEach { firstPoint, endPoint in
                let factory = shape.shapeType.factory
                let configuration = ShapeConfiguration(startPoint: firstPoint,
                                                       endPoint: endPoint,
                                                       isFilled: shape.isFilled,
                                                       color: shape.color)
                let path = factory.create(configuration: configuration)
                path.stroke()
                
            }
        }
    }
    
    func undo() {
        guard let lastMoment = states.popLast() else { return }
        shapes = lastMoment.shapes
        setNeedsDisplay()
    }
    
    func savePreviousMoment() {
        states.append(ShapesMomento(shapes: shapes))
    }
}
