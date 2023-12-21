//
//  DetailsViewController.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import UIKit

protocol DetailsViewControllerProtocol: AnyObject {
    func setData(_ cocktail: Cocktail)
}

final class DetailsViewController: UIViewController {
    
    // MARK: - Presenter
    var presenter: DetailsPresenterProtocol?
    
    // MARK: - Private UI Properties
    private lazy var nameLabel: UILabel = {
        var label = UILabel.makeLabel(
            with: "Recipe Name",
            font: .boldSystemFont(ofSize: 18)
        )
        return label
    }()
    
    private lazy var ingredientsView: UIView = {
        var view = UIView.makeMainView()
        return view
    }()
    
    private lazy var ingredientLabel: UILabel = {
        var label = UILabel.makeLabel(
            with: "ingredients",
            font: .boldSystemFont(ofSize: 15)
        )
        return label
    }()
    
    private lazy var ingredientsValueLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var instructionLabel: UILabel = {
        var label = UILabel.makeLabel(
            with: "Instruction",
            font: .boldSystemFont(ofSize: 15)
        )
        return label
    }()
    
    private lazy var instructionView: UIView = {
        var view = UIView.makeMainView()
        return view
    }()
    
    private lazy var instructionValueLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupNavigationBar()
        setupConstraints()
        presenter?.showCocktail()
        setFavoriteButton()
    }
    
    // MARK: - Private Actions
    @objc private func favoriteButtonDidTapped() {
        presenter?.favoriteButtonDidTapped()
        setFavoriteButton()
    }
    
    // MARK: - Private Methods
    private func setFavoriteButton() {
        if presenter?.isFavorite == true {
            navigationItem.rightBarButtonItem?.tintColor = .systemYellow
        } else {
            navigationItem.rightBarButtonItem?.tintColor = .systemGray
        }
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(ingredientLabel)
        view.addSubview(ingredientsView)
        view.addSubview(instructionLabel)
        view.addSubview(instructionView)
        ingredientsView.addSubview(ingredientsValueLabel)
        instructionView.addSubview(instructionValueLabel)
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalToSuperview()
        }
        
        ingredientLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(40)
        }
        
        ingredientsView.snp.makeConstraints { make in
            make.top.equalTo(ingredientLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
        
        ingredientsValueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.top.equalTo(ingredientsView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(40)
        }
        
        instructionView.snp.makeConstraints { make in
            make.top.equalTo(instructionLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
        
        instructionValueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    private func setupNavigationBar() {
        let favoriteButton = UIBarButtonItem(
            image: UIImage(systemName: "star.fill"),
            style: .done,
            target: self,
            action: #selector(favoriteButtonDidTapped)
        )
        
        navigationItem.rightBarButtonItem = favoriteButton
        navigationItem.rightBarButtonItem?.tintColor = .systemGray
    }
}

// MARK: - DetailsViewControllerProtocol
extension DetailsViewController: DetailsViewControllerProtocol {
    func setData(_ cocktail: Cocktail) {
        let name = cocktail.name
        let formattedName = name.prefix(1).capitalized + name.dropFirst().lowercased()
        nameLabel.text = formattedName
        instructionValueLabel.text = cocktail.instructions
        ingredientsValueLabel.text = cocktail.ingredients.joined(separator: ",")
    }
}
