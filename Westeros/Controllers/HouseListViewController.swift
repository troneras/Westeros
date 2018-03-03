//
//  HouseListTableViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

let HouseKey = "HouseKey"
let HouseDidChangeNotificationName = "HouseDidChange"
let lastHouseKey = "LastHouseKey"
protocol HouseListViewControllerDelegate: class {
    // Should
    // Will
    // Did
    func houselistViewController(_ vc: HouseListViewController, didSelectHouse: House)
}


class HouseListViewController: UITableViewController {

    // Mark: - Properties
    var model: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
    // Mark: - Initialization
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "HouseCell"
        // Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
    
        // Sincronizar house -> cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // Mark: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguamos la casa
        let house = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.houselistViewController(self, didSelectHouse: house)
        
        // Enviamos la misma información vía notificaciones
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(HouseDidChangeNotificationName), object: self, userInfo: [HouseKey: house])
        notificationCenter.post(notification)
        
        // Guardamos la última casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListViewController: HouseListViewControllerDelegate {
    func houselistViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        let houseDetailViewController = HouseDetailViewController(model: house).wrappedInNavigation()
        splitViewController?.showDetailViewController(houseDetailViewController, sender: nil)
    }
}

// Mark: - User Defaults
extension HouseListViewController {

    func saveLastSelectedHouse(at row: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(row, forKey: lastHouseKey)
        userDefaults.synchronize() // Por si acaso.
    }
    
    func lastSelectedHouse() -> House{
        let row = UserDefaults.standard.integer(forKey: lastHouseKey)
        return house(at: row)
    }
    
    func house(at index: Int) -> House{
        let house = model[index]
        return house
    }
}
