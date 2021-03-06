//
//  TableViewController.swift
//  test02
//
//  Created by Alejandro Yepes on 7/12/17.
//  Copyright © 2017 Alejandro Yepes. All rights reserved.
//

import UIKit
import RealmSwift
class TableViewController: UITableViewController
{
    
    var objects = [Any]()
    let realm = try! Realm()
    lazy var persons : Results <Person> =
        {
            self.realm.objects(Person.self)
    }()
    var name = String()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        
        for person in persons
        {
            if person.amount < 0
            {
                objects.append(person)
            }
        }
    }
    
    
    @objc func insertNewObject(_ sender: Any)
    {
        let invalidInput = UIAlertController(title: "Invalid Input", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        invalidInput.addAction(okAction)
        
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (texfield) in
            texfield.placeholder = "Amount"
            texfield.keyboardType = UIKeyboardType.decimalPad
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let insertAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let nameTextField = alert.textFields! [0] as UITextField
            let amountTextfield = alert.textFields! [1] as UITextField
            self.name = nameTextField.text!
            
            if var amount = Double(amountTextfield.text!)
            {
                amount = Double(round(100*amount)/100)

                if (self.name != "")
                {
                    if amount > 0
                    {
                        let person = Person(name: nameTextField.text!, amount: -amount)
                        self.objects.append(person)
                        try! self.realm.write
                        {
                            self.realm.add(person)
                        }
                        self.tableView.reloadData()
                    }
                    else {
                        self.present(invalidInput, animated: true, completion: nil)
                        return
                    }
                    
                }
                else
                {
                    self.present(invalidInput, animated: true, completion: nil)
                }
            }
            else
            {
                print ("invalid input")
                self.present(invalidInput, animated: true, completion: nil)
            }
            
            
        }
        alert.addAction(insertAction)
        present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let object = objects[indexPath.row] as! Person
        cell.textLabel!.text = object.name
        cell.detailTextLabel!.text = "$" + String(NSString( format: "%.2f" , abs(object.amount)))
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
     {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let person = objects.remove(at: indexPath.row)as! Person
            try! self.realm.write
            {
                self.realm.delete(person)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
     {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
     {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
