//
//  Cocktail.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import Foundation

struct Cocktail: Codable {
    let name: String
    let ingredients: [String]
    let instructions: String
}
