//
//  ThemeController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 26/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class ThemeController {
    
    //MARK: - Shared Instance
    static let shared = ThemeController()
    
    //MARK: - Properties
    let darkGrayBackground = UIColor(red:0.16, green:0.16, blue:0.17, alpha:1.0)
    let lightTextIconColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
    let redButtonColor = UIColor(red:0.79, green:0.12, blue:0.24, alpha:1.0)
    
    //MARK: - Public Functions
    func adjustNavigationBar(for navigationBar: UINavigationBar) {
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.layer.backgroundColor = UIColor.clear.cgColor
        navigationBar.tintColor = lightTextIconColor
        
        if let items = navigationBar.items {
            for item in items {
                item.leftBarButtonItem?.tintColor = lightTextIconColor
                item.rightBarButtonItem?.tintColor = lightTextIconColor
            }
        }
    }
    
    func adjustHomePageNavigationBar(for navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.layer.backgroundColor = redButtonColor.cgColor
        navigationBar.tintColor = redButtonColor
        
        if let items = navigationBar.items {
            for item in items {
                item.leftBarButtonItem?.tintColor = lightTextIconColor
                item.rightBarButtonItem?.tintColor = lightTextIconColor
            }
        }
        
    }
    
    func adjustHomePageTabBar(for tabBar: UITabBar) {
        tabBar.backgroundImage = UIImage()
        tabBar.tintColor = lightTextIconColor
        tabBar.barTintColor = darkGrayBackground
    }
    
    func setStatusBar(view: UIView) -> UIView {
        let statusBar =  UIView()
        if let statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame {
            statusBar.frame = statusBarFrame
        }
        statusBar.backgroundColor = redButtonColor
        return statusBar
    }
    
}
