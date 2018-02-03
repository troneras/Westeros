//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 01/02/2018.
//  Copyright © 2018 Westeros. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
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
        
        firstEpisodeOfFirstSeason = Episode(title: "1", number: 1, releaseDate: dateFormatter.date(from: "17/04/2011")!, season: firstSeason)
        secondEpisodeOfFirstSeason = Episode(title: "2", number: 2, releaseDate: dateFormatter.date(from: "24/04/2011")!, season: firstSeason)
        
        firstEpisodeOfSecondSeason = Episode(title: "1", number: 1, releaseDate: dateFormatter.date(from: "01/04/2012")!, season: firstSeason)
        secondEpisodeOfSecondSeason = Episode(title: "2", number: 2, releaseDate: dateFormatter.date(from: "08/04/2012")!, season: firstSeason)
        
        firstEpisodeOfThirdSeason = Episode(title: "1", number: 1, releaseDate: dateFormatter.date(from: "31/03/2013")!, season: firstSeason)
        secondEpisodeOfThirdSeason = Episode(title: "2", number: 2, releaseDate: dateFormatter.date(from: "07/04/2013")!, season: firstSeason)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSeasonExistence() {
        XCTAssertNotNil(firstSeason)
        XCTAssertNotNil(secondSeason)
        XCTAssertNotNil(thirdSeason)
    }
    
    func testAddEpisodes() {
        XCTAssertEqual(firstSeason.count, 0)
        firstSeason.add(episode: firstEpisodeOfFirstSeason)
        
        XCTAssertEqual(firstSeason.count, 1)
        firstSeason.add(episode: firstEpisodeOfSecondSeason)
        
        XCTAssertEqual(firstSeason.count, 2)
        
        firstSeason.add(episode: firstEpisodeOfSecondSeason)
        XCTAssertEqual(firstSeason.count, 2)
    }
    
    func testSeasonEquality() {
        // Identidad
        XCTAssertEqual(firstSeason, firstSeason)
        
        // Igualdad
        let theFirst = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "17/04/2011")!)
        XCTAssertEqual(firstSeason, theFirst)
        
        // Desigualdad
        XCTAssertNotEqual(firstSeason, secondSeason)
    }

    func testHashable() {
        XCTAssertNotNil(firstSeason.hashValue)
        XCTAssertNotNil(secondSeason.hashValue)
        XCTAssertNotNil(thirdSeason.hashValue)
    }
    
    func testSeasonComparision() {
        XCTAssertGreaterThan(secondSeason, firstSeason)
        XCTAssertGreaterThan(thirdSeason, secondSeason)
        XCTAssertGreaterThan(thirdSeason, firstSeason)
    }
    
    func testCustomStringConvertible() {
        XCTAssertNotNil(firstSeason.description)
        XCTAssertNotNil(secondSeason.description)
        XCTAssertNotNil(thirdSeason.description)
    }
    
}
