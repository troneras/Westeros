//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {
    
    // Mark: - Properties
    let dataSource: ArrayDataSource<Element>
    
    // Mark: - Initialization
    init(dataSource: ArrayDataSource<Element>, title: String, style: UITableViewStyle) {
        self.dataSource = dataSource
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
