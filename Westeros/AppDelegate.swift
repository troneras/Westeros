//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 25/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var splitViewController: UISplitViewController!
    var seasonDetailViewController: SeasonDetailViewController!
    var houseDetailViewController: HouseDetailViewController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Crear Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .cyan
        
        // Creamos unos modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
       // Creamos los controladores
        let houseListViewController = HouseListViewController(model: houses)
        let lastHouseSelected = houseListViewController.lastSelectedHouse()
        houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
        
        let seasonListViewController = SeasonListViewController(model: seasons)
        seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        
        // Asignamos delegados
        if UIDevice.current.userInterfaceIdiom == .pad {
            houseListViewController.delegate = houseDetailViewController
            seasonListViewController.delegate = seasonDetailViewController
        } else {
            houseListViewController.delegate = houseListViewController
            seasonListViewController.delegate = seasonListViewController
        }
        
        // Creamos el UITabBarController
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [houseListViewController, seasonListViewController]
        tabBarController.delegate = self
        // Creamos el UISplitViewController y le asignamos los viewControllers
        splitViewController = UISplitViewController()
        splitViewController.viewControllers = [tabBarController.wrappedInNavigation(), houseDetailViewController.wrappedInNavigation(), seasonDetailViewController.wrappedInNavigation()]
        
        // Asignamos el RootVC
        window?.rootViewController = splitViewController
        return true
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let detailNavigationController: UINavigationController
        if type(of: viewController) == SeasonListViewController.self {
            detailNavigationController = seasonDetailViewController.wrappedInNavigation()
        } else {
            detailNavigationController = houseDetailViewController.wrappedInNavigation()
        }
        splitViewController.showDetailViewController(detailNavigationController, sender: nil)
    }
}

