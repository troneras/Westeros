//
//  DataSources.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

final class DataSourceRepository {
    
    static func houseDataSource(model: [House]) -> ArrayDataSource<House> {
        return ArrayDataSource(model: model) { house, tableView in
            let cellId = "HouseCellId"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!
        }
    }
    
    static func memberDataSource(model: [Person]) -> ArrayDataSource<Person> {
        return ArrayDataSource(model: model) { person, tableView in
            let cellId = "PersonCellId"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            
            cell?.textLabel?.text = person.fullName
            
            return cell!
        }
    }
}
