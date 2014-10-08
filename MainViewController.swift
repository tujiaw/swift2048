//
//  MainViewController.swift
//  swift2048-001
//
//  Created by tujiaw on 14-10-8.
//  Copyright (c) 2014年 tujiaw. All rights reserved.
//

import UIKit

class MainViewController:UIViewController {
    var dimension = 4
    var maxNumber = 2048
    var width:CGFloat = 50
    var padding:CGFloat = 6
    var backgrounds:Array<UIView>
    var gmodel:GameModel
    
    override init() {
        self.backgrounds = Array<UIView>()
        self.gmodel = GameModel(dimension: self.dimension)
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        for i in 0...16 {
            getNumber()
        }
        
    }
    
    func setupBackground() {
        var x:CGFloat = 30
        var y:CGFloat = 150
        
        for _ in 1...dimension {
            x = 30
            for _ in 1...dimension {
                var background = UIView(frame: CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                backgrounds.append(background)
                x += padding + width
            }
            y += padding + width
        }
    }
    
    func getNumber() {
        let randv = Int(arc4random_uniform(10))
        println("\(randv)")
        var seed = 2
        if randv == 1 {
            seed = 4
        }
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        if gmodel.isFull() {
            println("is full")
            return
        }
        
        if gmodel.setPosition(row, col: col, value: seed) == false {
            getNumber()
            return
        }
        
        insertTitle((row, col), value:seed)
    }
    
    func insertTitle(pos:(Int, Int), value:Int) {
        let (row, col) = pos
        let x = 30 + CGFloat(col) * (width + padding)
        let y = 150 + CGFloat(row) * (width + padding)
        
        let title = TitleView(pos: CGPointMake(x, y), width: width, value: value)
        self.view.addSubview(title)
        self.view.bringSubviewToFront(title)
        
        title.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1))
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions.TransitionNone, animations: {
            () -> Void in
            title.layer.setAffineTransform(CGAffineTransformMakeScale(1, 1))
            }, completion: {
                (finished:Bool) -> Void in
                UIView.animateWithDuration(0.08, animations: {
                    () -> Void in
                    title.layer.setAffineTransform(CGAffineTransformIdentity)
                })
        })
    }
}