//
//  ShopModel.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/7/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import Foundation
import Parse

struct ShopItem: Codable {
    var name: String
    var price: Double
    var description: String
    var quantity: Int
}

class Shop {
    var allItems: [ShopItem]
    var items: [ShopItem]
    var itemsInCreateShop: [ShopItem]
    var username: String
    var userShops: [String]
    var userShopDates: [NSDate]
    var itemDesc: String
    
    init () {
        self.allItems = []
        self.items = []
        self.itemsInCreateShop = []
        self.username = ""
        self.userShops = []
        self.itemDesc = ""
        self.userShopDates = []
    }
    
    func loadAllItems() {
        /*let healingPotion = ShopItem(name: "Potion of Healing", price: 50.0, description: "You regain 2d4 + 2 hit points when you drink this potion. The potion's red liquid glimmers when agitated.", quantity: 1)
        let crossbowBolts = ShopItem(name: "Crossbow Bolts", price: 1.0, description: "Ammunition: You can use a weapon that has the ammunition property to make a ranged Attack only if you have ammunition to fire from the weapon. Each time you Attack with the weapon, you expend one piece of ammunition. Drawing the ammunition from a Quiver, case, or other container is part of the Attack. At the end of the battle, you can recover half your expended ammunition by taking a minute to Search the battlefield.", quantity: 1)
        let lamp = ShopItem(name: "Lamp", price: 0.5, description: "A lamp casts bright light in a 15-foot radius and dim light for an additional 30 feet. Once lit, it burns for 6 hours on a flask (1 pint) of oil.", quantity: 1)
        let dagger = ShopItem(name: "Dagger", price: 2.0, description: "Damage: 1d4, Damage Type: Piercing, Item Type: Melee Weapon, Properties: Finesse, Light, Range, Thrown, Range 20/60", quantity: 1)
        let healersKit = ShopItem(name: "Healer's Kit", price: 5, description: "This kit is a leather pouch containing bandages, salves, and splints. The kit has ten uses. As an action, you can expend one use of the kit to stabilize a creature that has 0 hit points, without needing to make a Wisdom (Medicine) check.", quantity: 1)
        allItems.append(healingPotion)
        allItems.append(crossbowBolts)
        allItems.append(lamp)
        allItems.append(dagger)
        allItems.append(healersKit)
 */
        let query = PFQuery(className:"AllItems") // Fetches all the items
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                for thing in objects! {
                    let newShopItem = ShopItem(name: thing["name"] as! String, price: thing["price"] as! Double , description: thing["desc"] as! String, quantity: 1)
                    self.allItems.append(newShopItem)
                }
                print(self.allItems)
            } else {
                // Log details of the failure
                print(error as Any)
            }
        }
    }
    
    func loadUserItems () {
        let query = PFQuery(className:"UserItems") // Fetches all the user's items
        query.whereKey("creator", equalTo: username)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                for thing in objects! {
                    let newShopItem = ShopItem(name: thing["name"] as! String, price: thing["price"] as! Double , description: thing["desc"] as! String, quantity: 1)
                    self.allItems.append(newShopItem)
                }
                //print(self.allItems)
            } else {
                // Log details of the failure
                print(error as Any)
            }
        }
    }
    
    func randomizeShop() {
        items = []
        var shopSize: Int
        var noMatch = true //making sure that an item isn't already in a shop
        var iterator = 0
        //this choses a random number for the amount of items in a shop from 7 to 13
        shopSize = (Int(arc4random_uniform(6)) + 7)
        
        while iterator <= shopSize {
            let randomInt = Int(arc4random_uniform(UInt32(allItems.count)))
            for thing in items {
                if thing.name == allItems[randomInt].name {
                    noMatch = false
                }
            }
            if noMatch == true {
                items.append(allItems[randomInt])
                iterator += 1
            }
            noMatch = true
        }
        
        /*for _ in 0..<shopSize {
        
            let randomInt = Int(arc4random_uniform(UInt32(allItems.count)))
            for thing in items {
                if thing.name == allItems[randomInt].name {
                    noMatch = true
                }
            }
            if noMatch == false {
                items.append(allItems[randomInt])
            }
        }*/
        
    }
    
    func clearRandomShop() {
        items = []
    }
    
    func addItem(name: String, price: Double, description: String, quantity: Int) {
        //let newItem = ShopItem(name: name, price: price, description: description, quantity: quantity)
        
        //Send user created item to database
        let userItem = PFObject(className:"UserItems")
        userItem["name"] = name
        userItem["price"] = price
        userItem["desc"] = description
        userItem["creator"] = AppDelegate.myModel.username
        userItem.acl = PFACL(user: PFUser.current()!)
        userItem.acl?.getPublicReadAccess = true
        userItem.saveInBackground()
        
        //load userItems
        AppDelegate.myModel.loadUserItems()
    }
    
    func createNewShop(newItem: ShopItem) {
        var noMatch = false
        for thing in self.itemsInCreateShop {
            if thing.name == newItem.name  {
                noMatch = true
            }
        }
        if noMatch == false {
            itemsInCreateShop.append(newItem)
        }
    }
    
    func toJSON() -> String {
        let encoder = JSONEncoder()
        let encodedResult = try? encoder.encode(items)
        return String(data: encodedResult!, encoding: .utf8)!
    }
    
    func createdToJSON() -> String {
        let encoder = JSONEncoder()
        let encodedResult = try? encoder.encode(itemsInCreateShop)
        return String(data: encodedResult!, encoding: .utf8)!
    }
    
    func randomShopCode() -> String {
        let possibleChars = "ABCDEFGHJKMNPQRSTUVWXYZ23456789" //No I, L, 0, or O for readability
        var possCharArray = Array(possibleChars)
        var randomCode: String = ""
        for _ in (1...5) {
            randomCode.append(possCharArray[Int(arc4random()) % possCharArray.count])
        }
        print(randomCode)
        return randomCode
    }
    
    func loadUserShops () {
        userShops = []
        let query = PFQuery(className:"Shops") // Fetches all the user's items
        query.whereKey("ShopOwner", equalTo: username)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                for thing in objects! {
                    self.userShops.append(thing["ShopCode"] as! String)
                    self.userShopDates.append(thing.createdAt! as NSDate)
                }
            } else {
                // Log details of the failure
                print(error as Any)
            }
    }
    }
}
