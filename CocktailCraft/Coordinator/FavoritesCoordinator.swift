//
//  FavoritesCoordinator.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import UIKit

// MARK: - FavoriteCoordinatorProtocol
protocol FavoriteCoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    func start()
    func showDetails(with cocktail: Cocktail)
}

final class FavoriteCoordinator: FavoriteCoordinatorProtocol {
    
    var navigationController: UINavigationController
    let moduleBuilder = ModuleBuilder()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoriteVC = moduleBuilder.createFavoritesModule(with: self)
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        navigationController.pushViewController(favoriteVC, animated: false)
    }
    
    func showDetails(with cocktail: Cocktail) {
    }
    

}
