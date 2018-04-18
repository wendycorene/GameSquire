//
//  PlayerLoadedShopViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/30/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit

class PlayerLoadedShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updated_data), name:Notification.Name("UPDATED_DATA"), object: nil)
        // Do any additional setup after loading the view.
        
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

    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updated_data(notification:Notification) -> Void{
        itemDescTV.text = AppDelegate.myModel.itemDesc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var itemDescTV: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
