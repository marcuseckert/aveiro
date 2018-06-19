//
//  ExampleCircleLine.swift
//  PresentationDeveloper
//
//  Created by Marcus Eckert on 13.05.2018.
//  Copyright © 2018 Forge and Form GmbH. All rights reserved.
//

import Foundation
import UIKit

class ExampleCircleLine: UIView {
    
    //Show the parent objects
    private let rotationVisible = false
    
    private lazy var objectA: UIView = {
        let v = makeTestView()
        v.backgroundColor = rotationVisible ? Colors.blue : .clear
        return v
    }()
    private lazy var objectB: UIView = {
        let v = makeTestView()
        v.backgroundColor = rotationVisible ? Colors.blue : .clear
        return v
    }()
    private let objectC: UIView = makeTestView()
    private let inset: CGFloat = 30.0
    private var step: CGFloat {
        return (self.bounds.size.width - inset*2.0)/2.0
    }
    private var stepHalf: CGFloat {
        return self.step * 0.5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.darkBlue
        //We setup the hierarchy as follows: view -> objectA -> objectB -> objectC
        addSubview(objectA)
        objectA.addSubview(objectB)
        objectB.addSubview(objectC)
        
        //These are the objects' positions in the space of our containing view
        let objectAPositionInView = CGPoint(x: self.bounds.width-inset-stepHalf, y: self.bounds.height*0.5)
        let objectBPositionInView = CGPoint(x: self.bounds.width-inset-step-stepHalf, y: self.bounds.height*0.5)
        let objectCPositionInView = CGPoint(x: self.bounds.width-inset-step*2.0, y: self.bounds.height*0.5)
        
        //We assign the positions to the objects
        //ObjectA doesn't need any conversions since it's a direct child of our containing view and already in the correct
        //coordinate system
        objectA.center = objectAPositionInView
        //ObjectB is a child of objectA and will need its position converted from our containing view to its parent, objectA
        objectB.center = convert(objectBPositionInView, to: objectA)
        //ObjectC is a child of objectA and will need its position converted from our containing view to its parent, objectB
        objectC.center = convert(objectCPositionInView, to: objectB)
        
        //We're adding a tap gesture recognizer to re-trigger our animation
        let tap = UITapGestureRecognizer(target: self, action: #selector(addRotationAnimations))
        addGestureRecognizer(tap)
        
    }
    
    override func didMoveToSuperview() {
        addRotationAnimations()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addRotationAnimations() {
    
        let now = CACurrentMediaTime()
        
        //First Animation
        //
        let ani = CABasicAnimation(keyPath: "transform.rotation.z")
        ani.duration = 1.0
        ani.beginTime = objectB.layer.convertTime(now, from: nil)
        ani.fillMode = kCAFillModeBoth
        //We start slowly and then accelelerate
        ani.timingFunction = CAMediaTimingFunction(controlPoints: 0.9, 0.0, 0.8, 0.5)
        ani.fromValue = 0.0
        ani.toValue = CGFloat.pi
        
        objectB.layer.add(ani, forKey: nil)
        
        //we set the model layer to its correct end value
        objectB.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0.0, 0.0, 1.0)
        
        //Second Animation
        //
        //Instead of recreating the animation, we just change a couple of values and add it to our parent layer
        //Our changes won't affect objectB since changes to animations don't propagate after they were added to a layer
        
        //We start very quickly, overshoot (1.4) and then settle slowly into the final value
        ani.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 1.4, 0.1, 1.0)
        //the animation now begins at the current time plus the previous animation's duration, so right after the previous animation
        ani.beginTime = objectA.layer.convertTime(now, from: nil) + ani.duration
        ani.toValue = -CGFloat.pi
        objectA.layer.add(ani, forKey: nil)
        
        //we set the model layer to its correct end value
        objectA.layer.transform = CATransform3DMakeRotation(-CGFloat.pi, 0.0, 0.0, 1.0)
    }
}
