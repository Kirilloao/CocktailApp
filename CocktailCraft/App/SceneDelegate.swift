//
//  SceneDelegate.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 19.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var tabBarCoordinator: TabBarCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator?.start()
        
        window?.rootViewController = tabBarCoordinator?.tabBarController
        window?.makeKeyAndVisible()
        

    }
}

