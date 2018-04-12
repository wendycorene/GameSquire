//
//  ParseManagedObjects.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 4/4/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import Foundation
import Parse

class ParsedShopItems:PFObject, PFSubclassing {
    //THIS DOESN'T DO SHIT
    @NSManaged var name:String
    @NSManaged var price:Double
    @NSManaged var desc:String
    
    static func parseClassName() -> String {
        return "ParsedShopItems"
    }
    
}
