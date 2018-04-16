//
//  ItemsInSpecificShopTableViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 4/16/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit

class ItemsInSpecificShopTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(AppDelegate.myModel.items.count)
        print(AppDelegate.myModel.items)
        return AppDelegate.myModel.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsInShop", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = AppDelegate.myModel?.items[indexPath.row].name
        cell.detailTextLabel?.text = String(AppDelegate.myModel.items[indexPath.row].price)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "\(AppDelegate.myModel.items[indexPath.row].name)", message: "\(AppDelegate.myModel.items[indexPath.row].description)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}

