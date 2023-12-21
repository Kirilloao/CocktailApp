//
//  UIView + Extension.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 21.12.2023.
//

import UIKit

extension UIView {
    static func makeMainView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.78, green: 0.93, blue: 0.93, alpha: 1.00)
        view.layer.cornerRadius = 10
        return view
    }
}

