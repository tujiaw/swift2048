//
//  MainTabViewController.swift
//  swift2048-001
//
//  Created by tujiaw on 14-10-8.
//  Copyright (c) 2014年 tujiaw. All rights reserved.
//

import UIKit

class MainTabViewController:UITabBarController {
    override init() {
        super.init(nibName:nil, bundle:nil)
        
        var viewMain = MainViewController()
        viewMain.title = "2048"
        
        var viewSetting = SettingViewController()
        viewSetting.title = "Setting"
        
        var main = UINavigationController(rootViewController: viewMain)
        var setting = UINavigationController(rootViewController: viewSetting)

        self.viewControllers = [main, setting]
        self.selectedIndex = 0
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



