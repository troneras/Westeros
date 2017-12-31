//
//  ArrayDataSourceTest.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import XCTest
@testable import Westeros

class ArrayDataSourceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testArrayDataSourceCreation() {
        let tableView = UITableView()
        
        let dataSource = ArrayDataSource(model: [1,2,3,4,5,6]) { number, tableView in
            let cellId = "CellId"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            
            cell?.textLabel?.text = "The number is \(number)"
            
            return cell!
        }
        
        
        XCTAssertNotNil(dataSource)
    }
    
}
