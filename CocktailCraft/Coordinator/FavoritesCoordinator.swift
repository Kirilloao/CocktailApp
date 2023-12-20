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
    }
    
    func showDetails(with cocktail: Cocktail) {
    }
    

}
