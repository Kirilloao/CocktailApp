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
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var view = UIView.makeMainView()
        return view
    }()
    
    private lazy var cocktailImageView: UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel.makeLabel(font: .boldSystemFont(ofSize: 17))
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
        let name = cocktail.name
        let formattedName = name.prefix(1).capitalized + name.dropFirst().lowercased()
        nameLabel.text = formattedName
        cocktailImageView.image = ImageStorage.shared.getRandomImage()
    }
    
    func configure(with cocktailData: CocktailData) {
        nameLabel.text = cocktailData.name
        cocktailImageView.image = ImageStorage.shared.getRandomImage()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(cocktailImageView)
        mainView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        cocktailImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(cocktailImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-10)
        }
    }
}
