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
        setViews()
        registerCell()
        setupTableView()
        addObserver()
    }
    
    private func configureTableHeaderView() {

    }
    
    // MARK: - Private Methods
    private func addObserver() {
        let notificationNames = [NSNotification.Name("Saved"), NSNotification.Name("Deleted")]
        for name in notificationNames {
            NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { [weak self] _ in
                self?.presenter.fetchCoctails()
            }
        }
    }
    
    private func setupTableView() {
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        configureTableHeaderView()
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
        presenter?.cocktails.count ?? 0
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
//extension FavoritesViewController {
//    
////    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        50
////    }
//    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        let headerView = UIScrollView()
//////        headerView.backgroundColor = .blue
////
////        let firstView = UIView()
////        firstView.backgroundColor = .red
////        firstView.layer.cornerRadius = 10
////        headerView.addSubview(firstView)
////
////        firstView.snp.makeConstraints { make in
////            make.top.equalToSuperview().offset(10)
////            make.bottom.equalToSuperview().offset(-10)
////            make.left.equalToSuperview().offset(20)
////            make.width.equalTo(100)
////        }
////
////
////        let firstImageView = UIImageView()
////        firstView.addSubview(firstImageView)
////        firstImageView.contentMode = .scaleAspectFit
////        firstImageView.image = UIImage(named: "vodka")
////        firstImageView.snp.makeConstraints { make in
////            make.centerY.equalToSuperview()
////            make.left.equalToSuperview().offset(5)
////            make.height.equalTo(20)
////            make.width.equalTo(20)
////        }
////
////        let firstTextLabel = UILabel()
////        firstTextLabel.text = "Vodka"
////        firstView.addSubview(firstTextLabel)
////
////        firstTextLabel.snp.makeConstraints { make in
////            make.centerY.equalToSuperview()
////            make.left.equalTo(firstImageView.snp.right).offset(5)
////            make.right.equalToSuperview().offset(-5)
////        }
////
////
////
////
////        headerView.contentSize = CGSize(width: 100 * 4, height: 50)
////
////
//////        let secondView = UIView()
//////        let thirdView = UIView()
//////        let fourtView = UIView()
////
////
////
////
////        return headerView
//    }
//}

// MARK: - FavoritesViewControllerProtocol
extension FavoritesViewController: FavoritesViewControllerProtocol {
    func showCocktails() {
        tableView.reloadData()
    }
}
