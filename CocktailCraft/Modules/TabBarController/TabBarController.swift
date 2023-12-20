//
//  TabBarController.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarAppearance()
        setupViewControllers()
    }
    
    // MARK: - Private Methods
    private func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        appearance.stackedLayoutAppearance.normal.iconColor = .label
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.label]
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .label
    }
    
    private func setupViewControllers() {
        let vc1 = UINavigationController(rootViewController: ListViewController()) 
        vc1.title = "Home"
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        
        setViewControllers([vc1], animated: true)
    }
}
