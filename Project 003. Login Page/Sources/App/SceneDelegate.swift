//
//  SceneDelegate.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 11.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let router = RouterComponent.start()
        let initialController = router.entry
        window?.rootViewController = initialController
        window?.makeKeyAndVisible()
    }
}

