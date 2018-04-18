//
//  FirstViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 2/16/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //This should change the background color - Hunter
        self.view.backgroundColor = UIColor(red: 214/255, green: 204/255, blue: 169/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadUserShopsBTN(_ sender: UIButton) {
        AppDelegate.myModel.loadUserShops()
        AppDelegate.myModel.loadUserItems()
    }
}

