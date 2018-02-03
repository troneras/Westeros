//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 02/02/2018.
//  Copyright © 2018 Westeros. All rights reserved.
//

import UIKit

class SeasonListViewController: UITableViewController {
    
    // Mark: - Properties
    let model: [Season]
    
    // Mark: - Initialization
    init(model: [Season]) {
        self.model = model
        super.init(style: .plain)
        title = "GoT Seasons"
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
        let cellID = "SeasonCell"
        // Descubrir cual es la temporada que tenemos que mostrar
        let season = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        // Sincronizar person -> cell
        cell?.textLabel?.text = season.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: season.releaseDate)
        cell?.detailTextLabel?.text = "Air date: \(date)"
        
        return cell!
    }
    
    // Mark: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let season = model[indexPath.row]
        
        let viewController = SeasonDetailViewController(model: season)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
