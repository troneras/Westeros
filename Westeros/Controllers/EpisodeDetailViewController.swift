//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 03/02/2018.
//  Copyright © 2018 Westeros. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metadataLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    // Mark: - Properties
    private let model: Episode
    
    // Mark: - Initialization
    init(model: Episode) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange), name: Notification.Name(SeasonDidChangeNotificationName), object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Baja en la notificación
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    // Mark: - Notifications
    @objc func seasonDidChange(notification: Notification) {
        navigationController?.popViewController(animated: true)
    }
    

    // Mark: - Sync
    func syncModelWithView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        titleLabel.text = model.title
        metadataLabel.text = "\(model.season?.name ?? "") - Episode \(model.number)"
        let date = dateFormatter.string(from: model.airDate)
        airDateLabel.text = "Air Date: \(date)"
    }

}
