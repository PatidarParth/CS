//
//  BucketItem.swift
//  BucketList
//
//  Created by Parth Patidar on 9/17/17.
//  Copyright © 2017 Parth Patidar. All rights reserved.
//

import UIKit

class BucketItem  {
    var name: String = ""
    var date: Date
    var Done: Bool
    var Longitude: Double
    var Latitude: Double
    var des: String = ""
    
    
    init(name:String, date:Date, done:Bool, longitude:Double, latitude:Double, des:String)
    {
        self.name = name
        self.date = date
        self.Done = done
        self.Latitude = latitude
        self.Longitude = longitude
        self.des = des
    }
}
