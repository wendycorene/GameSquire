//
//  SecondViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 2/16/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse
import MessageUI
class SecondViewController: UIViewController {

    @IBOutlet weak var LogoutBTNActual: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        if PFUser.current() == nil{
            LogoutBTNActual.isEnabled = false
        }
        else{
            LogoutBTNActual.isEnabled = true
        }
    }
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
    @IBAction func LogoutBtn(_ sender: Any) {
        PFUser.logOut()
        var currentUser = PFUser.current()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var dieLBL: UILabel!
    
    @IBAction func rollD20BTN(_ sender: UIButton) {
        var d20result: Int
        d20result = (Int(arc4random_uniform(20)) + 1)
        dieLBL.text = String(d20result)
    }
    
}

