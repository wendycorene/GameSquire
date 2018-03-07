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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBTN(_ sender: UIButton) {
        if Int(priceTF.text!) != nil && Int(quantityTF.text!) != nil{
            AppDelegate.myModel.addItem(name: itemTF.text!, price: Int(priceTF.text!)!, description: descriptionTF.text!, quantity: Int(quantityTF.text!)!)
        }
    }
    
    @IBOutlet weak var itemTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var quantityTF: UITextField!
    
}
