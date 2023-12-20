//
//  ViewController.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import UIKit

protocol ListViewControllerProtocol: AnyObject {
    func success()
}

final class ListViewController: UITableViewController {
    
    // MARK: - Private UI Properties
    private lazy var searchController: UISearchController = {
        var searchController = UISearchController(searchResultsController: nil)
        return searchController
    }()
    
    // MARK: - Presenter
    var presenter: ListPresenterProtocol!
    
    // MARK: - Life Cyclem Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        registerCell()
    }
    
    // MARK: - Private Methods
    private func setupSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type your cocktail"
        definesPresentationContext = true
        searchController.searchBar.delegate = self
    }
    
    private func registerCell() {
        tableView.register(CocktailCell.self, forCellReuseIdentifier: CocktailCell.reuseID)
    }
}

// MARK: - UITableViewDataSource
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.cocktails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: CocktailCell.reuseID, for: indexPath)
                as? CocktailCell
        else {
            return UITableViewCell()
        }
        
        let cocktail = presenter.cocktails[indexPath.row]
        cell.configure(with: cocktail)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktail = presenter.cocktails[indexPath.row]
        presenter.cocktailDidTapped(with: cocktail)
    }
}

// MARK: - UISearchResultsUpdating
extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text != "" {
            self.presenter.getCocktails(with: text)
        }
    }
}

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        presenter.cocktails = []
//        tableView.reloadData()
    }
}

// MARK: - ListViewControllerProtocol
extension ListViewController: ListViewControllerProtocol {
    func success() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
