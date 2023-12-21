//
//  ImageStorage.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import UIKit

final class ImageStorage {
    
    // MARK: - Static Properties
    static let shared = ImageStorage()
    
    // MARK: - Private Properties
    private let images: [UIImage] = (1...10).compactMap { UIImage(named: "\($0)") }
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Methods
    func getRandomImage() -> UIImage {
        images.randomElement() ?? UIImage()
    }
}
