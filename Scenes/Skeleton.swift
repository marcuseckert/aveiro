//
//  ExampleA.swift
//  PresentationDeveloper
//
//  Created by Marcus Eckert on 13.05.2018.
//  Copyright © 2018 Forge and Form GmbH. All rights reserved.
//

import Foundation
import UIKit

class Skeleton: UIView {
    
    private lazy var testLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = Colors.red.cgColor
        layer.frame = CGRect(x: -15.0, y: -15, width: 30.0, height: 30.0)
        layer.cornerRadius = 15.0
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.darkBlue
        
        layer.addSublayer(testLayer)
        testLayer.position = CGPoint(x: frame.width*0.5, y: frame.height*0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func start() {
        
    }
}
