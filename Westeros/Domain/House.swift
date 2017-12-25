//
//  House.swift
//  Westeros
//
//  Created by Alexandre Freire on 25/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

typealias Words = String

// MARK: - House
final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    
    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
    }
}

// MARK: - Sigil
final class Sigil {
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String) {
        self.image = image
        self.description = description
    }
}

