//
//  Builder:.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 21.01.2024.
//

import UIKit

protocol ModuleBuilder {
    static func assembleNewAccountModule() -> UIViewController
}

final class Builder: ModuleBuilder {
    static func assembleNewAccountModule() -> UIViewController {
        let view = LoginView()
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
        
        view.output = presenter
        interactor.output = presenter
        router.rootViewController = view
        
        return view
    }
}
