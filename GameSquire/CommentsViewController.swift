//
//  CommentsViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 4/18/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class CommentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var commentTV: UITextView!
    
    @IBAction func submitBTN(_ sender: UIButton) {
        let comment = PFObject(className:"Comments")
        comment["thoughts"] = commentTV.text
        comment.acl = PFACL(user: PFUser.current()!)
        comment.acl?.getPublicReadAccess = true
        comment.saveInBackground()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
