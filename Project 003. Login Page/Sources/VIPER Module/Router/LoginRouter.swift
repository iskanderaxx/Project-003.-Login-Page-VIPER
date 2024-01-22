//
//  LoginRouter.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 19.01.2024.
//

import UIKit

// 5. Презетер сообщает Роутеру о необходимости открыть новый экран (экран аккаунта пользователя)
protocol CreateNewAccountRouterInput {
    func openUserProfileScreenWith(login: String)
}

final class LoginRouter: CreateNewAccountRouterInput {
    weak var rootViewController: UIViewController?
    
    func openUserProfileScreenWith(login: String) {
        let controller = UIViewController(nibName: nil, bundle: nil)
        controller.view.backgroundColor = .systemIndigo
        rootViewController?.present(controller, animated: true, completion: nil)
    }
}
