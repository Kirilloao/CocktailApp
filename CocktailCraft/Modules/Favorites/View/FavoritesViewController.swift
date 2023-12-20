//
//  FavoritesViewController.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import UIKit

protocol FavoritesViewControllerProtocol {
    func showCocktails()
}

final class FavoritesViewController: UITableViewController {
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Favorites"
        registerCell()
    }
    
    // MARK: - Private Methods
    private func registerCell() {
        tableView.register(CocktailCell.self, forCellReuseIdentifier: CocktailCell.reuseID)
    }
}

// MARK: - UITableViewDataSource
extension FavoritesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CocktailCell.reuseID,
                for: indexPath
            ) as? CocktailCell
        else {
            return UITableViewCell()
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoritesViewController {
    
}

// MARK: - FavoritesViewControllerProtocol
extension FavoritesViewController: FavoritesViewControllerProtocol {
    func showCocktails() {
    }
}
