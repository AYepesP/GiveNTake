//
//  Person.swift
//  Give n Take
//
//  Created by Alejandro Yepes on 7/12/17.
//  Copyright © 2017 Alejandro Yepes. All rights reserved.
//

import UIKit
import RealmSwift
class Person: Object {
   dynamic var name = String()
   dynamic var amount = Int()
    
   convenience init(name: String, amount: Int)
    {
        self.init()
        self.name = name
        self.amount = amount
    }
    
}