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
        var label = UILabel()
        label.text = "Recipe Name"
        return label
    }()
    
    private lazy var ingredientsLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var instructionLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        presenter?.showCocktail()
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(ingredientsLabel)
        view.addSubview(instructionLabel)
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.centerX.equalToSuperview()
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.top.equalTo(ingredientsLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
    }
}

// MARK: - DetailsViewControllerProtocol
extension DetailsViewController: DetailsViewControllerProtocol {
    func setData(_ cocktail: Cocktail) {
        nameLabel.text = cocktail.name
        instructionLabel.text = cocktail.instructions
        ingredientsLabel.text = cocktail.ingredients.joined(separator: ",")
    }
}
