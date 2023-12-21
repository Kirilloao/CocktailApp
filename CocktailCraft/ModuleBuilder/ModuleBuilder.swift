//
//  ModuleBuilder.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import UIKit

// MARK: - ModuleBuilderProtocol
protocol ModuleBuilderProtocol {
    func createListModule(with coordinator: ListCoordinatorProtocol) -> UIViewController
    func createDetailsModule(with cocktail: Cocktail) -> UIViewController
    func createFavoritesModule(with coordinator: FavoriteCoordinatorProtocol) -> UIViewController
}

// MARK: - ModuleBuilder
final class ModuleBuilder: ModuleBuilderProtocol {
    
    func createListModule(with coordinator: ListCoordinatorProtocol) -> UIViewController {
        let view = ListViewController()
        let networkManager = NetworkManager()
        let presenter = ListPresenter(
            view: view,
            networkManager: networkManager,
            coordinator: coordinator
        )
        view.presenter = presenter
        return view
    }
    
    func createDetailsModule(with cocktail: Cocktail) -> UIViewController {
        let view = DetailsViewController()
        let presenter = DetailsPresenter(view: view, cocktail: cocktail)
        view.presenter = presenter
        return view
    }
    
    func createFavoritesModule(with coordinator: FavoriteCoordinatorProtocol) -> UIViewController {
        let view = FavoritesViewController()
        let presenter = FavoritePresenter(view: view, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
}
