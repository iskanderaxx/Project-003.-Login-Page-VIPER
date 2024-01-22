//
//  LoginInteractor.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 19.01.2024.
//

import UIKit

// 2. Презентер сообщает Интерактору о том, что Интерактор должен создать аккаунт
protocol CreateNewAccountInteractorInput {
    var output: CreateNewAccountInteractorOutput? { get set }
    
    func createNewAccountWith(login: String, password: String)
}

// 4. Интерактор возвращает сообщение о том, что аккаунт создан (или об ошибке) + дополнительные данные
protocol  CreateNewAccountInteractorOutput: AnyObject {
    func didRecieve(error: String)
    func didCreateAccountWith(login: String)
}

final class LoginInteractor: CreateNewAccountInteractorInput {
    weak var output: CreateNewAccountInteractorOutput?
    
    // 3. Интерактор идет в Модель и берет оттуда данные
    func createNewAccountWith(login: String, password: String) {
        let _ = LoginEntity(login: login, password: password)
        // Прописывается дополнительная реализация того, что еще должно произойти при создании аккаунта
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.output?.didCreateAccountWith(login: login)
        }
    }
}
