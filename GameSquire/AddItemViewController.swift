//
//  AddItemViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/7/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit

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
        if Double(priceTF.text!) != nil && Int(quantityTF.text!) != nil{
            AppDelegate.myModel.addItem(name: itemTF.text!, price: Double(priceTF.text!)!, description: descriptionTF.text!, quantity: Int(quantityTF.text!)!)
        }
    }
    
    @IBOutlet weak var itemTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var quantityTF: UITextField!
    
}
