//
//  Person.swift
//  Give n Take
//
//  Created by Alejandro Yepes on 7/12/17.
//  Copyright © 2017 Alejandro Yepes. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name = String()
    var amount = Int()
    
   convenience init(name: String, amount: Int)
    {
        self.init()
        self.name = name
        self.amount = amount
    }
    
}
