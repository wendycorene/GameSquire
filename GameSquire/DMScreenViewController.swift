//
//  DMScreenViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/7/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class DMScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func generateBTN(_ sender: UIButton) {
        if AppDelegate.myModel.items.count == 0 {
            AppDelegate.myModel.randomizeShop()
        }
        
        
    }
    
    @IBAction func unwindSegue(Sender: UIStoryboardSegue){
        
    }

    @IBAction func loadShopBTN(_ sender: UIButton) {
        /*
         * TODO
         * We should generate a list of shops previously made
         * by this user and show a list and let them select
         * and then show what is in the shop
         */
    }
}
