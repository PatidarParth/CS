//
//  BucketItem.swift
//  BucketList
//
//  Created by Parth Patidar on 9/17/17.
//  Copyright © 2017 Parth Patidar. All rights reserved.
//

import UIKit

class BucketItem: NSObject {
    var name: String = ""
    var completed: Bool = false
    var Date: String = ""
    
    init(name:String, date:String) {
        self.name = name
        self.Date = date 
    }
}
