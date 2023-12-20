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
    func showCocktail()
}

// MARK: - DetailsPresenter
final class DetailsPresenter: DetailsPresenterProtocol {
    
    private unowned var view: DetailsViewControllerProtocol
    private var cocktail: Cocktail
    
    init(view: DetailsViewControllerProtocol, cocktail: Cocktail) {
        self.view = view
        self.cocktail = cocktail
    }
    
    func showCocktail() {
        view.setData(cocktail)
    }
}
