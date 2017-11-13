//
//  Person.swift
//  Give n Take
//
//  Created by Alejandro Yepes on 7/12/17.
//  Copyright © 2017 Alejandro Yepes. All rights reserved.
//

import UIKit
import RealmSwift
class Person: Object
{
   @objc dynamic var name = String()
   @objc dynamic var amount = Double()
    
    convenience init(name: String, amount: Double)
    {
        self.init()
        self.name = name
        self.amount = amount
    }
    
}
