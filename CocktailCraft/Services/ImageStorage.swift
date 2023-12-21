//
//  ImageStorage.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import UIKit

final class ImageStorage {
    
    static let shared = ImageStorage()
    
    let images: [UIImage] = (1...10).compactMap { UIImage(named: "\($0)") }
    
    private init() {}
    
    func getRandomImage() -> UIImage {
        images.randomElement() ?? UIImage()
    }

}
