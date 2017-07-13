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
    @IBOutlet weak var amountLabel: UILabel!
    
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
            if person.amount > 0
            {
                firstVeiwControllerSum += person.amount
                youAreOwedLabel.text = "$"+String(firstVeiwControllerSum)
            }
            else if (person.amount < 0)
            {
                thirdViewControllerSum += person.amount
                youOweLabel.text = "$"+String(abs(thirdViewControllerSum))
            }
            else {
                youOweLabel.text = "$0.00"
                youAreOwedLabel.text = "$0.00"
            }
        }
        for person in persons
        {
            total += person.amount
        }
        if (total > 0 )
        {
            mainLabel.text = "You are owed:"
            amountLabel.text = "$" + String(total)
        }
        else if (total < 0)
        {
            mainLabel.text = "You owe:"
            amountLabel.text = "$" + String(abs(total))
        }
        else
        {
            mainLabel.text = "Balance :"
            amountLabel.text = "$$0.00"
        }
        total = 0
        thirdViewControllerSum = 0
        firstVeiwControllerSum = 0
    }
    override func viewWillAppear(_ animated: Bool) {
        calculateBalance()
    }
}

