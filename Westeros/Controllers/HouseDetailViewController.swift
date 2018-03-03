//
//  HouseViewController.swift
//  Westeros
//
//  Created by Alexandre Freire García on 29/12/17.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    
    @IBOutlet weak var wordsLabel: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // MARK: - Properties
    var model: House
    
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
        setupUI()
        syncViewWithModel()
    }
    
    // MARK: - Sync
    func syncViewWithModel() {
        // Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
        title = model.name
        
    }
    
    // Mark: - UI
    func setupUI() {
        // Button creation
        let wiki = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))
        let members = UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayMembers))
        // Add button
        navigationItem.rightBarButtonItems = [wiki, members]
    }
    
    // Mark: - Navigation
    @objc func displayWiki() {
        // WikiViewController creation
        let wikiViewController = WikiViewController(model: model)
        
        // Push
        navigationController?.pushViewController(wikiViewController, animated: true)
    }
    
    @objc func displayMembers() {
        // memberListViewController creation
        let memberListViewController = MemberListViewController(model: model.sortedMembers)
        
        // Push
        navigationController?.pushViewController(memberListViewController, animated: true)
    }
}

extension HouseDetailViewController: HouseListViewControllerDelegate {
    func houselistViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        self.model = house
        syncViewWithModel()
    }
}
