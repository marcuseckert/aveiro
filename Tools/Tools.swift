//
//  Tools.swift
//  PresentationDeveloper
//
//  Created by Marcus Eckert on 06.05.2018.
//  Copyright © 2018 Forge and Form GmbH. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

public func makeTestView() -> UIView {
    let v = UIView()
    v.backgroundColor = Colors.red
    v.frame = CGRect(x: 0, y: -15, width: 30.0, height: 30.0)
    v.layer.cornerRadius = 15.0
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
}

public extension CGPoint {
    
    func length() -> CGFloat {
        let v = x*x+y*y
        if v != 0.0 {
            return sqrt(v)
        }
        return 0.0
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x-right.x, y: left.y-right.y)
    }
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x+right.x, y: left.y+right.y)
    }
    static func * (left: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: left.x*right, y: left.y*right)
    }
    
    static func / (left: CGPoint, right: CGFloat) -> CGPoint {
        if right == 0.0 {
            assert(false, "Division by zero!")
            return CGPoint.zero
        } else {
            return CGPoint(x: left.x/right, y: left.y/right)
        }
    }
    
    static func += ( left : inout CGPoint, right: CGPoint) {
        left = CGPoint(x: left.x+right.x, y: left.y+right.y)
    }
    
    static func -= ( left : inout CGPoint, right: CGPoint) {
        left = CGPoint(x: left.x-right.x, y: left.y-right.y)
    }
}


