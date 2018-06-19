//
//  ViewController.swift
//  PresentationDeveloper
//
//  Created by Marcus Eckert on 06.05.2018.
//  Copyright © 2018 Forge and Form GmbH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //showExampleCircleLine()
        
        showSkeleton()
    }
    
    private func showExampleCircleLine() {
        let scene = ExampleCircleLine(frame: view.bounds)
        view.addSubview(scene)
    }
    
    private func showSkeleton() {
        let skeleton = Skeleton(frame: view.bounds)
        view.addSubview(skeleton)
        skeleton.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

