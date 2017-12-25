//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 25/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        let stark = House(name: "Stark", sigil: starkSigil, words: "¡Se acerca el invierno!")
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: UIImage(), description: "León Rampante")
        XCTAssertNotNil(lannisterSigil)
    }
}
