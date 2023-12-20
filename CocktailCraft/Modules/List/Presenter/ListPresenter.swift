//
//  ListPresenter.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import Foundation

// MARK: - ListPresenterProtocol
protocol ListPresenterProtocol: AnyObject {
    var cocktails: [Cocktail] { get set }
    init(view: ListViewControllerProtocol, networkManager: NetworkManagerProtocol, coordinator: ListCoordinatorProtocol)
    func getCocktails(with name: String)
    func cocktailDidTapped(with cocktail: Cocktail)
}

// MARK: - ListPresenter
final class ListPresenter: ListPresenterProtocol {
    
    var cocktails: [Cocktail] = []
    
    private unowned let view: ListViewControllerProtocol
    private var networkManager: NetworkManagerProtocol
    private var coordinator: ListCoordinatorProtocol
    
    init(view: ListViewControllerProtocol, networkManager: NetworkManagerProtocol, coordinator: ListCoordinatorProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.coordinator = coordinator
    }
    
    func getCocktails(with name: String) {
        networkManager.fetchCoctails(with: name) { result in
            switch result {
            case .success(let cocktails):
                self.cocktails = cocktails
                self.view.success()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cocktailDidTapped(with cocktail: Cocktail) {
        coordinator.showDetails(with: cocktail)
    }
}
