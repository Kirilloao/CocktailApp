//
//  UILabel + Extension.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 21.12.2023.
//

import UIKit

extension UILabel {
    static func makeLabel(with text: String = "", font: UIFont) -> UILabel {
        let label = UILabel()
        label.font = font
        return label
    }
}
