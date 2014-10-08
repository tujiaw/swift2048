//
//  ViewController.swift
//  swift2048-001
//
//  Created by tujiaw on 14-10-8.
//  Copyright (c) 2014年 tujiaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(sender:UIButton) {
        let alertView = UIAlertView()
        alertView.title = "start"
        alertView.message = "are you ready?"
        alertView.addButtonWithTitle("go!")
        alertView.show()
        alertView.delegate = self
    }
    
    func alertView(alertView:UIAlertView, clickedButtonAtIndex buttonIndex:Int) {
        self.presentViewController(MainTabViewController(), animated: true, completion: nil)
    }
}

