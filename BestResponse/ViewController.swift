//
//  ViewController.swift
//  BestResponse
//
//  Created by AD Mohanraj on 1/18/17.
//  Copyright © 2017 AD Mohanraj. All rights reserved.
//

import UIKit

class ViewController: EZSwipeController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setupView() {
        datasource = self
    }
}

extension ViewController: EZSwipeControllerDataSource {
    func viewControllerData() -> [UIViewController] {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let left = storyboard.instantiateViewController(withIdentifier: "left")
        let right = storyboard.instantiateViewController(withIdentifier: "right")
        
        return [left, right]
    }
}

