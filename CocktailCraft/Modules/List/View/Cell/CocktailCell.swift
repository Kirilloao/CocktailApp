//
//  CocktailCell.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import UIKit
import SnapKit

final class CocktailCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let reuseID = String(describing: CocktailCell.self)
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Cocktail"
        return label
    }()
    
    private lazy var ingredientsLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with cocktail: Cocktail) {
        nameLabel.text = cocktail.name
    }
    
    // MARK: - Private Methods
    private func setViews() {
        contentView.addSubview(nameLabel)
    }
    
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
    }
}
