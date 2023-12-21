//
//  FavoritesPresenter.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import Foundation

// MARK: - FavoritesPresenterProtocol
protocol FavoritesPresenterProtocol {
    init(view: FavoritesViewControllerProtocol, coordinator: FavoriteCoordinatorProtocol)
    var cocktails: [CocktailData] { get set }
    func fetchCoctails()
}

// MARK: - FavoritePresenter
final class FavoritePresenter: FavoritesPresenterProtocol {
    
    var cocktails: [CocktailData] = []
    
    private unowned var view: FavoritesViewControllerProtocol
    private var coordinator: FavoriteCoordinatorProtocol
    private var storageManager = StorageManager.shared
    
    init(view: FavoritesViewControllerProtocol, coordinator: FavoriteCoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
        fetchCoctails()
    }
    
    func fetchCoctails() {
        storageManager.fetchCocktails { result in
            if case .success(let cocktails) = result {
                self.cocktails = cocktails
                self.view.showCocktails()
            }
            
        }
    }
}
