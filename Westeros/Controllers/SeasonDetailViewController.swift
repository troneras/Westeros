//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 02/02/2018.
//  Copyright © 2018 Westeros. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var airDateField: UILabel!
    @IBOutlet weak var episodesCountField: UILabel!
    
    // Mark: - Properties
    let model: Season
    
    // Mark: - Initialization
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }

   
    // Mark: - Sync
    func syncModelWithView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        title = "Season"
        nameField.text = model.name
        let date = dateFormatter.string(from: model.releaseDate)
        airDateField.text = "Air date: \(date)"
        episodesCountField.text = "No. of episodes: \(model.count)"
    }

    // Mark: - Actions
    @IBAction func episodesDidTap(_ sender: Any) {
        let viewController = EpisodeListViewController(model: model.sortedEpisodes)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
