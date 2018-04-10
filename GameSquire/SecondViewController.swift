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
    }
    @IBAction func LogoutBtn(_ sender: Any) {
        PFUser.logOut()
        var currentUser = PFUser.current()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

