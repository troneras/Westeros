//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 03/02/2018.
//  Copyright © 2018 Westeros. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    
    // Mark: - Properties
    private let model: [Episode]
    
    // Mark: - Initialization
    init(model: [Episode]) {
        self.model = model
        super.init(style: .plain)
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
        let cellID = "EpisodeCell"
        // Descubrir cual es el episodio que tenemos que mostrar
        let episode = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        // Sincronizar person -> cell
        cell?.textLabel?.text = episode.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: episode.airDate)
        cell?.detailTextLabel?.text = "Air date: \(date)"
        
        return cell!
    }
    
    // Mark: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let viewController = EpisodeDetailViewController(model: episode)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
