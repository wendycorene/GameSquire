//
//  ShopModel.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/7/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import Foundation

struct ShopItem {
    var name: String
    var price: Int
    var description: String
    var quantity: Int
}

class Shop {
    var items: [ShopItem]
    
    init () {
        self.items = []
    }
    
    func loadBasicShop(){
        let healingPotion = ShopItem(name: "Potion of Healing", price: 50, description: "You regain 2d4 + 2 hit points when you drink this potion. The potion's red liquid glimmers when agitated.", quantity: 1)
        items.append(healingPotion)
    }
    
    func addItem(name: String, price: Int, description: String, quantity: Int){
        let newItem = ShopItem(name: name, price: price, description: description, quantity: quantity)
        items.append(newItem)
    }
}
