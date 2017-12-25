//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 25/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import XCTest
@testable import Westeros


class PersonTests: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterEcistence() {
        let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertNotNil(ned)
    }
    
}
