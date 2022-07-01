//
//  ShapesMomento.swift
//  Paint App
//
//  Created by Aidyn Assan on 01.07.2022.
//

import UIKit

protocol Momento {
    var shapes: [ShapeViewModel] { get }
}

final class ShapesMomento: Momento {
    private(set) var shapes: [ShapeViewModel]
    
    init(shapes: [ShapeViewModel]) {
        self.shapes = shapes
    }
}
