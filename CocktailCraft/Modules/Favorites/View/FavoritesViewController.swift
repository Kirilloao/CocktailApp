//
//  FavoritesViewController.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import UIKit

protocol FavoritesViewControllerProtocol: AnyObject {
    func showCocktails()
}

final class FavoritesViewController: UITableViewController {
    
    // MARK: - Presenter
    var presenter: FavoritesPresenterProtocol!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        setViews()
        registerCell()
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
    }
    
    // MARK: - Private Methods
    private func addObserver() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Saved"), object: nil, queue: nil) { _ in
            self.presenter.fetchCoctails()
            self.tableView.reloadData()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Deleted"), object: nil, queue: nil) { _ in
            self.presenter.fetchCoctails()
            self.tableView.reloadData()
        }
    }
    
    private func setViews() {
        view.backgroundColor = .white
        title = "Favorites"
    }
    
    private func registerCell() {
        tableView.register(CocktailCell.self, forCellReuseIdentifier: CocktailCell.reuseID)
    }
}

// MARK: - UITableViewDataSource
extension FavoritesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.cocktails.count
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
        
        let cocktail = presenter.cocktails[indexPath.row]
        cell.configure(with: cocktail)
        cell.selectionStyle = .none
        
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
