//
//  LoginPresenter.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 19.01.2024.
//

import Foundation

// 6. Протокол с ссылкой на Вью, чтобы передать собранные данные для отображения, полученные от Интерактора
protocol CreateNewAccountPresenterInput {
    var output: CreateNewAccountPresenterOutput? { get set }
}
// Второй протокол нужен потому, что Презентер обрабатывает Вью-события, по сути, выступая делегатом Вью
protocol  CreateNewAccountPresenterOutput: AnyObject {
}

// События Вью приходят через протокол ViewOutput, на который Презентер подписан, то же самое с Интерактором
final class LoginPresenter: CreateNewAccountViewOutput, CreateNewAccountInteractorOutput {
    weak var output: CreateNewAccountPresenterOutput?
    
    // Реализация "иньекции зависимостей" с объектами, которые взаимодействуют с Презетером
    private var view: CreateNewAccountViewInput
    private var interactor: CreateNewAccountInteractorInput
    private var router: CreateNewAccountRouterInput
    
    init(view: CreateNewAccountViewInput, interactor: CreateNewAccountInteractorInput, router: CreateNewAccountRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func createAccountWith(login: String, password: String) {
        interactor.createNewAccountWith(login: login, password: password)
    }
    
    func didRecieve(error: String) {
        // Роутер показывает alert через метод .showAlert
    }
    
    func didCreateAccountWith(login: String) {
        router.openUserProfileScreenWith(login: login)
    }
}

