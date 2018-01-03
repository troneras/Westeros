//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject {
    var source: ArrayDataSource<Element>?
    weak var viewController: UIViewController?
}

final class HousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let house = source?.element(at: indexPath),
            let navigationController = viewController?.navigationController else {
            
                return
        }
                
        let houseViewController = HouseViewController(model: house)
        navigationController.pushViewController(houseViewController, animated: true)
        
    }
}
