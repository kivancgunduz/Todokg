//
//  Item.swift
//  Todokg
//
//  Created by yiğit on 18.06.2018.
//  Copyright © 2018 Ghost35. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
    
}
