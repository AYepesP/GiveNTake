//
//  SecondViewController.swift
//  Give n Take
//
//  Created by Alejandro Yepes on 7/11/17.
//  Copyright © 2017 Alejandro Yepes. All rights reserved.
//

import UIKit
import RealmSwift
class SecondViewController: UIViewController {
    var objects = [Any]()
    let realm = try! Realm()
    lazy var persons : Results <Person> =
        {
            self.realm.objects(Person.self)
    }()
    
    
    var firstVeiwControllerSum = Double()
    var thirdViewControllerSum = Double()
    var total = Double()
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var youOweLabel: UILabel!
    @IBOutlet weak var youAreOwedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateBalance()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func calculateBalance()
    {
        for person in persons
        {
            if person.amount > 0 {
                firstVeiwControllerSum += person.amount
                youAreOwedLabel.text = String(firstVeiwControllerSum)
            }
            else
            {
                thirdViewControllerSum += person.amount
                youOweLabel.text = String(thirdViewControllerSum)
            }
        }
        for person in persons
        {
            total += person.amount
        }
        if (total > 0 )
        {
            mainLabel.text = "You are owed: $\(total)"
        }
        else if (total < 0)
        {
            mainLabel.text = "You owe: $\(abs(total))"
        }
        else
        {
            mainLabel.text = "Balance : $0.00"
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        calculateBalance()
    }
}

