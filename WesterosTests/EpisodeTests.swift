//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 01/02/2018.
//  Copyright © 2018 Westeros. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    
    // Mark: - Properties
    var firstSeason: Season!
    var secondSeason: Season!
    var thirdSeason: Season!
    
    var firstEpisodeOfFirstSeason: Episode!
    var secondEpisodeOfFirstSeason: Episode!
    
    var firstEpisodeOfSecondSeason: Episode!
    var secondEpisodeOfSecondSeason: Episode!
    
    var firstEpisodeOfThirdSeason: Episode!
    var secondEpisodeOfThirdSeason: Episode!
    
    var dateFormatter: DateFormatter!
    
    override func setUp() {
        super.setUp()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        firstSeason = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "17/04/2011")!)
        secondSeason = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "01/04/2012")!)
        thirdSeason = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "31/03/2013")!)
        
        firstEpisodeOfFirstSeason = Episode(name: "1", releaseDate: dateFormatter.date(from: "17/04/2011")!, season: firstSeason)
        secondEpisodeOfFirstSeason = Episode(name: "2", releaseDate: dateFormatter.date(from: "24/04/2011")!, season: firstSeason)
        
        firstEpisodeOfSecondSeason = Episode(name: "1", releaseDate: dateFormatter.date(from: "01/04/2012")!, season: firstSeason)
        secondEpisodeOfSecondSeason = Episode(name: "2", releaseDate: dateFormatter.date(from: "08/04/2012")!, season: firstSeason)
        
        firstEpisodeOfThirdSeason = Episode(name: "1", releaseDate: dateFormatter.date(from: "31/03/2013")!, season: firstSeason)
        secondEpisodeOfThirdSeason = Episode(name: "2", releaseDate: dateFormatter.date(from: "07/04/2013")!, season: firstSeason)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(firstEpisodeOfFirstSeason)
        XCTAssertNotNil(secondEpisodeOfFirstSeason)
        XCTAssertNotNil(firstEpisodeOfSecondSeason)
        XCTAssertNotNil(secondEpisodeOfSecondSeason)
        XCTAssertNotNil(secondEpisodeOfThirdSeason)
        XCTAssertNotNil(firstEpisodeOfThirdSeason)
    }
    
    func testEpisodeEquality() {
        // Identidad
        XCTAssertEqual(firstEpisodeOfFirstSeason, firstEpisodeOfFirstSeason)
        
        // Igualdad
        let theFirst = Episode(name: "1", releaseDate: dateFormatter.date(from: "17/04/2011")!, season: firstSeason)
        XCTAssertEqual(firstEpisodeOfFirstSeason, theFirst)
        
        // Desigualdad
        XCTAssertNotEqual(firstEpisodeOfFirstSeason, secondEpisodeOfFirstSeason)
    }
    
    func testHashable() {
        XCTAssertNotNil(firstEpisodeOfFirstSeason.hashValue)
        XCTAssertNotNil(secondEpisodeOfFirstSeason.hashValue)
        XCTAssertNotNil(firstEpisodeOfSecondSeason.hashValue)
        XCTAssertNotNil(secondEpisodeOfSecondSeason.hashValue)
        XCTAssertNotNil(firstEpisodeOfThirdSeason.hashValue)
        XCTAssertNotNil(secondEpisodeOfThirdSeason.hashValue)
    }
    
    func testEpisodeComparision() {
        XCTAssertLessThan(firstEpisodeOfFirstSeason, secondEpisodeOfFirstSeason)
        XCTAssertLessThan(firstEpisodeOfSecondSeason, secondEpisodeOfSecondSeason)
        XCTAssertLessThan(firstEpisodeOfThirdSeason, secondEpisodeOfThirdSeason)
    }
    
    func testCustomStringConvertible() {
        XCTAssertNotNil(firstEpisodeOfFirstSeason.description)
        XCTAssertNotNil(secondEpisodeOfFirstSeason.description)
        XCTAssertNotNil(firstEpisodeOfSecondSeason.description)
        XCTAssertNotNil(secondEpisodeOfSecondSeason.description)
        XCTAssertNotNil(firstEpisodeOfThirdSeason.description)
        XCTAssertNotNil(secondEpisodeOfThirdSeason.description)
    }
    
    
    
    
}
