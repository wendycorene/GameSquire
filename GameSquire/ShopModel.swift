//
//  ShopModel.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/7/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import Foundation

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
    
    init () {
        self.allItems = []
        self.items = []
        self.itemsInCreateShop = []
    }
    
    func loadAllItems() {
        let healingPotion = ShopItem(name: "Potion of Healing", price: 50.0, description: "You regain 2d4 + 2 hit points when you drink this potion. The potion's red liquid glimmers when agitated.", quantity: 1)
        let crossbowBolts = ShopItem(name: "Crossbow Bolts", price: 1.0, description: "Ammunition: You can use a weapon that has the ammunition property to make a ranged Attack only if you have ammunition to fire from the weapon. Each time you Attack with the weapon, you expend one piece of ammunition. Drawing the ammunition from a Quiver, case, or other container is part of the Attack. At the end of the battle, you can recover half your expended ammunition by taking a minute to Search the battlefield.", quantity: 1)
        let lamp = ShopItem(name: "Lamp", price: 0.5, description: "A lamp casts bright light in a 15-foot radius and dim light for an additional 30 feet. Once lit, it burns for 6 hours on a flask (1 pint) of oil.", quantity: 1)
        let dagger = ShopItem(name: "Dagger", price: 2.0, description: "Damage: 1d4, Damage Type: Piercing, Item Type: Melee Weapon, Properties: Finesse, Light, Range, Thrown, Range 20/60", quantity: 1)
        let healersKit = ShopItem(name: "Healer's Kit", price: 5, description: "This kit is a leather pouch containing bandages, salves, and splints. The kit has ten uses. As an action, you can expend one use of the kit to stabilize a creature that has 0 hit points, without needing to make a Wisdom (Medicine) check.", quantity: 1)
        allItems.append(healingPotion)
        allItems.append(crossbowBolts)
        allItems.append(lamp)
        allItems.append(dagger)
        allItems.append(healersKit)
    }
    
    func randomizeShop() {
        var shopSize: Int
        shopSize = (Int(arc4random_uniform(3)) + 1)
        
        for _ in 0..<shopSize {
            let randomInt = Int(arc4random_uniform(UInt32(allItems.count)))
            items.append(allItems[randomInt])
        }
        
    }
    
    func clearRandomShop() {
        items = []
    }
    
    func addItem(name: String, price: Double, description: String, quantity: Int) {
        let newItem = ShopItem(name: name, price: price, description: description, quantity: quantity)
        allItems.append(newItem)
    }
    
    func createNewShop(item: ShopItem) {
        itemsInCreateShop.append(item)
    }
    
    func toJSON() -> String {
        let encoder = JSONEncoder()
        let encodedResult = try? encoder.encode(items)
        return String(data: encodedResult!, encoding: .utf8)!
    }
}
