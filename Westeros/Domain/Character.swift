//
//  Character.swift
//  Westeros
//
//  Created by Alexandre Freire on 25/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import Foundation

final class Character {
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        get {
            if let _alias = _alias  {
                // Existe y está en _alias
                return _alias
            } else {
                return ""
            }
        }
    }
    
    init(name: String, alias: String, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
    
    
}
