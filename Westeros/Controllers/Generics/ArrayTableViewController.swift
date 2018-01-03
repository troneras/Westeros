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
    let arrayDelegate: BaseViewControllerDelegate<Element>?
    
    // Mark: - Initialization
    init(dataSource: ArrayDataSource<Element>, title: String, style: UITableViewStyle, delegate: BaseViewControllerDelegate<Element>? = nil) {
        self.dataSource = dataSource
        self.arrayDelegate = delegate
        
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
        
        // Asignamos las propiedades del delegate
        self.arrayDelegate?.viewController = self
        self.arrayDelegate?.source = self.dataSource
        
        // Asignamos el delegado de la tabla
        tableView.delegate = self.arrayDelegate as? UITableViewDelegate
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
