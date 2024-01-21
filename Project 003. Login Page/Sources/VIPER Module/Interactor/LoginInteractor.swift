//
//  CreateAccountInteractor.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 19.01.2024.
//

import UIKit

protocol CreateNewAccountInteractorInput {
    var output: CreateNewAccountInteractorOutput? { get set }
    
    func createNewAccountWith(login: String, password: String)
}

protocol  CreateNewAccountInteractorOutput {
    func didRecieve(error: String)
    func didCreateAccountWith(login: String)
}

final class CreateAccountInteractor: CreateNewAccountInteractorInput {
    
    var output: CreateNewAccountInteractorOutput?
    
    func createNewAccountWith(login: String, password: String) {
        <#code#>
    }
}
