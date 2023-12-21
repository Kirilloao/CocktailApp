//
//  DetailsPresenter.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import Foundation

// MARK: - DetailsPresenterProtocol
protocol DetailsPresenterProtocol: AnyObject {
    init(view: DetailsViewControllerProtocol, cocktail: Cocktail)
    var isFavorite: Bool { get set }
    func showCocktail()
    func favoriteButtonDidTapped()
}

// MARK: - DetailsPresenter
final class DetailsPresenter: DetailsPresenterProtocol {

    var isFavorite = false
    
    private unowned var view: DetailsViewControllerProtocol
    private var cocktail: Cocktail
    private let storageManager = StorageManager.shared
    
    init(view: DetailsViewControllerProtocol, cocktail: Cocktail) {
        self.view = view
        self.cocktail = cocktail
        
        storageManager.fetchCocktails { result in
            switch result {
                
            case .success(let data):
                data.forEach { cocktailData in
                    if cocktailData.name == cocktail.name {
                        isFavorite = true
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showCocktail() {
        view.setData(cocktail)
    }
    
    func favoriteButtonDidTapped() {
        isFavorite.toggle()
        
        if isFavorite {
            storageManager.create(cocktail)
        } else {
            storageManager.deleteCocktail(with: cocktail.name)
            NotificationCenter.default.post(name: NSNotification.Name("Deleted"), object: nil)
            
        }
    }
}
