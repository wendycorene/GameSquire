//
//  LoginRegisterViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/30/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class LoginRegisterViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        var currentUser = PFUser.current()
        if currentUser != nil {
            self.performSegue(withIdentifier: "loggingIn", sender: self)
        } else {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //This should change the background color - Hunter
        self.view.backgroundColor = UIColor(red: 214/255, green: 204/255, blue: 169/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // THE CODE FOR THIS CAME FROM BACK4APP DOCUMENTATION
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    
    
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func loginBTN(_ sender: UIButton) {
        let username = userTF.text
        let password = pwdTF.text
        
        AppDelegate.myModel.username = username!
        print(AppDelegate.myModel.username)
        
        PFUser.logInWithUsername(inBackground: username!, password: password!, block: {(user, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.alert(message: errorString!, title: "Error")
            }
            else {
                //self.alert(message: "Welcome back!", title: "Login")
                self.performSegue(withIdentifier: "loggingIn", sender: self)
            }
        })
    }    
}
