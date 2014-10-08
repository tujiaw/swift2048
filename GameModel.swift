//
//  GameModel.swift
//  swift2048-001
//
//  Created by tujiaw on 14-10-8.
//  Copyright (c) 2014年 tujiaw. All rights reserved.
//

import Foundation

class GameModel {
    var dimension:Int = 0
    var titles:Array<Int>
    
    init(dimension:Int) {
        self.dimension = dimension
        self.titles = Array<Int>(count: self.dimension * self.dimension, repeatedValue: 0)
    }
    
    func setPosition(row:Int, col:Int, value:Int) -> Bool {
        assert(row >= 0 && row < dimension)
        assert(col >= 0 && col < dimension)
        
        var index = self.dimension * row + col
        var val = titles[index]
        if val > 0 {
            println("this position is existing")
            return false
        }
        titles[index] = value
        return true
    }
    
    func emptyPositions() -> [Int] {
        var emptyTitles = Array<Int>()
        for i in 0...(self.dimension * self.dimension - 1) {
            if titles[i] == 0 {
                emptyTitles.append(i)
            }
        }
        return emptyTitles
    }
    
    func isFull() -> Bool {
        return emptyPositions().count == 0
    }
}