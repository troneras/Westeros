//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

class MemberListViewController: UITableViewController {
    
    // Mark: - Properties
    var model: [Person]
    
    // Mark: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HouseDidChangeNotificationName), object: nil) // Object es quien lo manda
        
    }
    
    deinit {
       // Baja en la notificación
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    // Mark: - Notifications
    @objc func houseDidChange(notification: Notification) {
        // Sacar el userInfo
        let info = notification.userInfo!
        
        // Sacar la casa
        let house = info[HouseKey] as? House
        
        // Actualizar el modelo
        model = (house?.sortedMembers)!
        
        // Sincronizar las vistas
        tableView.reloadData()
    }
    
    func person(at indexPath: IndexPath) -> Person {
        return model[indexPath.row]
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "MemberCell"
        // Descubrir cual es la persona que tenemos que mostrar
        let member = person(at: indexPath)
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar person -> cell
        cell?.textLabel?.text = member.name
        
        return cell!
    }
    
    // Mark: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguamos la persona
        let member = person(at: indexPath)
        
        // Pusheamos a MemberDetailViewController
        let memberDetailViewController = MemberDetailViewController(model: member)
        navigationController?.pushViewController(memberDetailViewController, animated: true)
    }
    
    
}
