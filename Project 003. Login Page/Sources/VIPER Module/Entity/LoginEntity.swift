//
//  LoginEntity.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 19.01.2024.
//

import Foundation

protocol CreateNewAccountEntity {
    var login: String { get set }
    var password: String { get set }
}

struct CreateAccountEntity: CreateNewAccountEntity {
    var login: String
    var password: String
}
