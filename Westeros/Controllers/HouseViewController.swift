//
//  HouseViewController.swift
//  Westeros
//
//  Created by Alexandre Freire García on 29/12/17.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    
    @IBOutlet weak var wordsLabel: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // MARK: - Properties
    let model: House
    
    // MARK: - Initialization
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    // Chaputa de los de Cupertino relacionada con los nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewModel()
    }
    
    // MARK: - Sync
    func syncViewModel() {
        // Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }
}
