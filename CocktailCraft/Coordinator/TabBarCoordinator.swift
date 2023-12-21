//
//  TabBarCoordinator.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import UIKit

// MARK: - CoordinatorProtocol
protocol TabBarCoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func start()
}

// MARK: - TabBarCoordinator
final class TabBarCoordinator: TabBarCoordinatorProtocol {
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        let listCoordinator = ListCoordinator(navigationController: UINavigationController())
        listCoordinator.start()
        
        let favoritesCoordinator = FavoriteCoordinator(navigationController: UINavigationController())
        favoritesCoordinator.start()
        
        tabBarController.viewControllers = [listCoordinator.navigationController, favoritesCoordinator.navigationController]
    }
}

