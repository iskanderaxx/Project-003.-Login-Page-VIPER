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
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = FirstScreen()
        window.makeKeyAndVisible()
        self.window = window
    }
}

