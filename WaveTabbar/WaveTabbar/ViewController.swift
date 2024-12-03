//
//  ViewController.swift
//  WaveTabbar
//
//  Created by Kavya Krishna K. on 03/12/24.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate
        self.delegate = self
        
        // Replace the default tabBar with the custom tabBar
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")
        
        // Set up the tabs
        setupTabBarControllers()
    }
    
    private func setupTabBarControllers() {
        // First Tab
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .red
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        // Second Tab
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        secondVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        
        // Third Tab
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .green
        thirdVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        
        // Fourth Tab
        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .yellow
        fourthVC.tabBarItem = UITabBarItem(title: "About", image: UIImage(systemName: "info.circle"), tag: 3)
        
        // Assign the view controllers to the tabBar
        self.viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
    
    // Handle tab selection
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let customTabBar = tabBar as? CustomTabBar else { return }
        customTabBar.updateWaveAndDot()
    }
}

