//
//  LoginRouter.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 19.01.2024.
//

import UIKit

protocol CreateNewAccountRouterInput {
    func openAuthentificationScreen()
}

final class CreateAccountRouter: CreateNewAccountRouterInput {
    func openAuthentificationScreen() {
        <#code#>
    }
}



typealias EntryPoint = SampleView & UIViewController

protocol SampleRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> SampleRouter
}

final class RouterComponent: SampleRouter {
    var entry: EntryPoint?
    
    static func start() -> SampleRouter {
        let router = RouterComponent()
        
        var view: SampleView = ViewControllerComponent()
        var presenter: SamplePresenter = PresenterComponent()
        var interactor: SampleInteractor = InteractorComponent()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
