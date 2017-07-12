//
//  ThirdViewController.swift
//  Give n Take
//
//  Created by Alejandro Yepes on 7/11/17.
//  Copyright © 2017 Alejandro Yepes. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
    }

    @IBAction func onTappedAddButton(_ sender: Any) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name of person"
        }
        alert.addTextField { (texfield) in
            texfield.placeholder = "Amount"
            texfield.keyboardType = UIKeyboardType.decimalPad
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let insertAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let name = alert.textFields! [0] as UITextField
            let amount = alert.textFields! [1] as UITextField
            

                self.tableView.reloadData()
            }
        }
    }

