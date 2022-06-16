//
//  Canvas.swift
//  Paint App
//
//  Created by Aidyn Assan on 13.06.2022.
//

import UIKit

class Canvas: UIView {
    private var cach: [(CGPoint, CGPoint)] = []
    private var lines: [Object] = []
    var shapeType: ButtonType = .pencil
    var objectColor: UIColor = .black
    var isFilled: Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let first = touches.first?.location(in: nil) else { return }
        lines.append(Object(color: objectColor, points: [(first, CGPoint())], buttonType: shapeType, isFilled: isFilled))
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let last = touches.first?.location(in: nil) else { return }
        
        

        
        guard var lastObject = lines.popLast() else { return }
        guard var endPoint = lastObject.points.popLast() else { return }
        
        endPoint.1 = last
        lastObject.points.append(endPoint)
        
        if lastObject.buttonType == .pencil {
            lastObject.points.append((last, last))
        }
        lines.append(lastObject)
        setNeedsDisplay()
        
//        touches.forEach { touch in
//            var last = touch.location(in: nil)
//
//            guard var lastObject = lines.popLast() else { return }
//            guard var endPoint = lastObject.points.popLast() else { return }
//
//            endPoint.1 = last
//            lastObject.points.append(endPoint)
//
//            if lastObject.buttonType == .pencil {
//                lastObject.points.append((last, last))
//            }
//            lines.append(lastObject)
//            setNeedsDisplay()
//        } 
    }
    
    override func draw(_ rect: CGRect) {
        lines.forEach { line in
            line.color.setStroke()
            
            line.points.forEach { first, end in
                var path = UIBezierPath()
                switch line.buttonType {
                case .pencil: drawLine(first: first, end: end, path: &path)
                case .line: drawLine(first: first, end: end, path: &path)
                case .rectangle: drawLRect(first: first, end: end, path: &path)
                case .triangle: drawTriangle(first: first, end: end, path: &path)
                case .circle: drawCircle(first: first, end: end, path: &path)
                }
                
                if line.isFilled {
                    line.color.setFill()
                    path.fill()
                }
                
                path.lineWidth = 2
                path.stroke()
                
            }
        }
    }
    
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    private func drawLine(first: CGPoint, end: CGPoint, path: inout UIBezierPath ) {
        
        path.move(to: first)
        path.addLine(to: end)
        
    }
    
    private func drawLRect(first: CGPoint, end: CGPoint, path: inout UIBezierPath ) {
        path = UIBezierPath(rect: CGRect(x: first.x, y: first.y, width: end.x - first.x, height: end.y - first.y))
    }
    
    private func drawTriangle(first: CGPoint, end: CGPoint, path: inout UIBezierPath ) {
        let middlePoint = CGPoint(x: first.x, y: end.y)
        
        path.move(to: first)
        path.addLine(to: middlePoint)
        path.addLine(to: end)
        path.close()

    }
    
    private func drawCircle(first: CGPoint, end: CGPoint, path: inout UIBezierPath ) {
        path = UIBezierPath(ovalIn: CGRect(x: first.x,
                                           y: first.y,
                                           width: end.x - first.x,
                                           height: end.y - first.y))
    }
}
