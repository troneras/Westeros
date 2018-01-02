//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate {
    
    // Mark: - Typealiases
    typealias Elements = [Element]
    
    // Mark: - Properties
    private let model: Elements
    
    // Mark: - Initialization
    init(model: Elements) {
        self.model = model
        super.init()
    }
    
    // Mark: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fatalError()
    }
}
