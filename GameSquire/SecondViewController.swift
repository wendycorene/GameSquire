//
//  SecondViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 2/16/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse
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
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //This should change the background color - Hunter
        self.view.backgroundColor = UIColor(red: 214/255, green: 204/255, blue: 169/255, alpha: 1)
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

