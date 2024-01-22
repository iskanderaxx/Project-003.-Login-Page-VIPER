//
//  LoginEntity.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 19.01.2024.
//

import Foundation

// Обычно взаимодействие с Энтити закрывается протоколами, если есть взаимодействие с сервисами
// В примере добавлено для красоты, т.к. в идеальном VIPER все взаимодействие строится через них
protocol CreateNewAccountEntity {
    var login: String { get set }
    var password: String { get set }
}

struct LoginEntity: CreateNewAccountEntity {
    var login: String
    var password: String
}
