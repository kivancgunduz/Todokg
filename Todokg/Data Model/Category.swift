//
//  Category.swift
//  Todokg
//
//  Created by yiğit on 18.06.2018.
//  Copyright © 2018 Ghost35. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
