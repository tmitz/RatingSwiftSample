//
//  Player.swift
//  Ratings
//
//  Created by Tomohiro Mitsumune on 2015/04/27.
//  Copyright (c) 2015年 tmitsumune. All rights reserved.
//

import UIKit

class Player: NSObject {
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}
