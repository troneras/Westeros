//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element>: NSObject, UITableViewDataSource {
    
    // Mark: - Typealiases
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> (UITableViewCell)
    
    // Mark: - Properties
    private let _model: Elements
    private let _cellMaker: CellMaker
    
    // Mark: - Initialization
    init(model: Elements, cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }
    
    // Mark: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = _model[indexPath.row]
        return _cellMaker(element, tableView)
    }
    
    func element(at indexPath: IndexPath) -> Element{
        return _model[indexPath.row]
    }
    
    
}
