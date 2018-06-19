//
//  CALayer+Extensions.swift
//  PresentationDeveloper
//
//  Created by Marcus Eckert on 16.05.2018.
//  Copyright © 2018 Forge and Form GmbH. All rights reserved.
//

import Foundation
import QuartzCore

public extension CALayer {
    
    public func removeImplicitAnimations() {
        
        self.actions = ["transform": NSNull(),
                        "opacity": NSNull(),
                        "hidden": NSNull(),
                        "position": NSNull(),
                        "anchorPoint": NSNull(),
                        "zPosition": NSNull(),
                        "frame": NSNull(),
                        "bounds": NSNull(),
                        "cornerRadius": NSNull(),
                        "strokeStart": NSNull(),
                        "borderWidth": NSNull(),
                        "strokeEnd": NSNull(),
                        "foregroundColor": NSNull(),
                        "backgroundColor": NSNull(),
                        "colors": NSNull(),
                        "lineWidth": NSNull(),
                        "content": NSNull(),
                        "sublayers": NSNull(),
                        "locations": NSNull()]
    }
}

