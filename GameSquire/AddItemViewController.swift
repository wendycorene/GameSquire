//
//  AddItemViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/7/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class AddItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This should change the background color - Hunter
        self.view.backgroundColor = UIColor(red: 214/255, green: 204/255, blue: 169/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBTN(_ sender: UIButton) {
        var uniqueItem = true
        var canCreate = true
        
        if itemTF.text == "" {
            let alert = UIAlertController(title: "Creating Item", message: "Please enter an item name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            canCreate = false
        }
        if Double(priceTF.text!) == nil || priceTF.text == nil {
            let alert = UIAlertController(title: "Creating Item", message: "Please enter a number for the item price.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            canCreate = false
        }
        if descriptionTF.text == "" {
            let alert = UIAlertController(title: "Creating Item", message: "Please enter an item description.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            canCreate = false
        }
        for thing in AppDelegate.myModel.allItems {
            if thing.name == itemTF.text {
                uniqueItem = false
                canCreate = false
            }
        }
        if !uniqueItem {
            let alert = UIAlertController(title: "Creating Item", message: "You have already created an item with this name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            canCreate = false
        }
        if Double(priceTF.text!) != nil && canCreate {
            AppDelegate.myModel.addItem(name: itemTF.text!, price: Double(priceTF.text!)!, description: descriptionTF.text!, quantity: 1)
            let alert = UIAlertController(title: "Creating Item", message: "\(itemTF.text!) created!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBOutlet weak var itemTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!

}
