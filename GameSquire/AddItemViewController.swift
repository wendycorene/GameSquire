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
        
        //how to make a gradient background
        
        //These are the two RGB color codes used in the gradient
        let topColor = UIColor(red: 214.0/255.0, green: 204.0/255.0, blue: 169.0/255.0, alpha: 1)
        //let botColor = UIColor(red: 160.0/255.0, green: 138.0/255.0, blue: 88.0/255.0, alpha: 1)
        let botColor = UIColor(red: 56.9/255.0, green: 50.6/255.0, blue: 31.8/255.0, alpha: 1)
        
        //this is to know where the colors begin and end within the gradient
        let gradientColor: [CGColor] = [topColor.cgColor, botColor.cgColor]
        let gradientLocation: [Float] = [0.0, 1.0]
        
        //This is actually adding the gradient layer to the view with the bounds of the two colors
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        gradientLayer.locations = gradientLocation as [NSNumber]
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBTN(_ sender: UIButton) {
        if Double(priceTF.text!) != nil {
            AppDelegate.myModel.addItem(name: itemTF.text!, price: Double(priceTF.text!)!, description: descriptionTF.text!, quantity: 1)
        }
    }
    
    @IBOutlet weak var itemTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!

}
