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
    let alias: String
    let house: House
    
    init(name: String, alias: String, house: House) {
        self.name = name
        self.alias = alias
        self.house = house
    }
}
