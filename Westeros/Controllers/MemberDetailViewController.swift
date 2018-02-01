//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 01/02/2018.
//  Copyright © 2018 Westeros. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aliasLabel: UILabel!
    
    // Mark: - Properties
    private let model: Person
    
    // Mark: - Initialization
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncViewWithModel()
    }
    
    // Mark: - Sync Model with View
    func syncViewWithModel() {
        // Model -> View
        nameLabel.text = model.fullName
        aliasLabel.text = model.alias
        houseImageView.image = model.house.sigil.image
        title = model.name
        
    }

}
