//
//  ViewController.swift
//  BestResponse
//
//  Created by AD Mohanraj on 1/18/17.
//  Copyright © 2017 AD Mohanraj. All rights reserved.
//

import UIKit

class SwipeViewController: EZSwipeController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // view.backgroundColor = UIColor.yellow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setupView() {
        datasource = self
        // navigationBarShouldNotExist = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// Configurations for SwipeViewController
extension SwipeViewController: EZSwipeControllerDataSource {
    func viewControllerData() -> [UIViewController] {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let left = storyboard.instantiateViewController(withIdentifier: "Feed")
        let right = storyboard.instantiateViewController(withIdentifier: "Profile")
        
        return [left, right]
    }
    
    func titlesForPages() -> [String] {
        return ["Feed", "Profile"]
    }
    
    func indexOfStartingPage() -> Int {
        return 0
    }
    
    func changedToPageIndex(_ index: Int) {
        if index == 0 {
            print("Switched to View 1.")
        }
    }
    
    func navigationBarDataForPageIndex(_ index: Int) -> UINavigationBar {
        var title = ""
        if index == 0 {
            title = "Feed"
        } else if index == 1 {
            title = "Profile"
        }
        
        let navigationBar = UINavigationBar()
        navigationBar.barStyle = UIBarStyle.default
        print(navigationBar.barTintColor ?? UIColor.black)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
        
        let navigationItem = UINavigationItem(title: title)
        navigationItem.hidesBackButton = true
        
        if index == 0 {
            
            let leftButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: Selector(("a")))
            leftButtonItem.tintColor = UIColor.black
            
            let rightButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: Selector(("a")))
            rightButtonItem.tintColor = UIColor.black
            
            navigationItem.leftBarButtonItem = leftButtonItem
            navigationItem.rightBarButtonItem = rightButtonItem
        } else if index == 1 {
            
            let leftButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.camera, target: self, action: Selector(("a")))
            leftButtonItem.tintColor = UIColor.black
            
            navigationItem.leftBarButtonItem = leftButtonItem
            navigationItem.rightBarButtonItem = nil
        }
        
        navigationBar.pushItem(navigationItem, animated: false)
        return navigationBar
    }
    
    func disableSwipingForLeftButtonAtPageIndex(_ index: Int) -> Bool {
        if index == 0 {
            return true
        }
        return false
    }
    
    func clickedLeftButtonFromPageIndex(_ index: Int) {
        if index == 0 {
            print("Pull up search view.")
        }
    }
}

