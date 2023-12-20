//
//  AppCoordinator.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import UIKit

// MARK: - LiListCoordinatorProtocolst
protocol ListCoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func start()
    func showDetails(with cocktail: Cocktail)
}

// MARK: - ListCoordinator
final class ListCoordinator: ListCoordinatorProtocol {
    
    var navigationController: UINavigationController
    let moduleBuilder = ModuleBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listVC = moduleBuilder.createListModule(with: self)
        listVC.tabBarItem.image = UIImage(systemName: "house")
        listVC.tabBarItem.title = "Cocktails"
        navigationController.pushViewController(listVC, animated: true)
    }
    
    func showDetails(with cocktail: Cocktail) {
        let detailsVC = moduleBuilder.createDetailsModule(with: cocktail)
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
