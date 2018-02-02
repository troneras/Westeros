//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses: [House]!
    var localSeasons: [Season]!
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 4)
    }
    
    func testLocalRepositorySeasonsCreation() {
        let seasons = Repository.local.seasons
        XCTAssertNotNil(seasons)
        XCTAssertEqual(seasons.count, 7)
    }
 
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsSortedArrayOfSeasons() {
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInsensitively() {
        let stark = Repository.local.house(named: "sTark")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testLocalRepositoryReturnsHousesTypeSafe() {
        let stark = Repository.local.house(named: .stark)
        XCTAssertEqual(stark?.name, "Stark")
        
        let lannister = Repository.local.house(named: .lannister)
        XCTAssertEqual(lannister?.name, "Lannister")
        
        let tyrell = Repository.local.house(named: .tyrell)
        XCTAssertEqual(tyrell?.name, "Tyrell")
        
        let targaryen = Repository.local.house(named: .targaryen)
        XCTAssertEqual(targaryen?.name, "Targaryen")
        
        XCTAssertNotEqual(targaryen?.name, stark?.name)
    }
    
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: { $0.count == 6 })
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testSeasonFiltering() {
        var filtered = Repository.local.seasons(filteredBy: { $0.count == 2 })
        XCTAssertEqual(filtered.count, 6)
        
        var onlyOne = Repository.local.seasons(filteredBy: { $0.count > 2 })
        XCTAssertEqual(onlyOne.count, 1)

    }
    
}
