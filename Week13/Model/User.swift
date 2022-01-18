//
//  User.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 18.01.2022.
//

import Foundation

class User {
    
    let name: String
    let surname: String
    let email: String
    let password: String
    let username: String
    
    init(name: String, surname: String, email: String, password: String, username: String) {
        self.name = name
        self.surname = surname
        self.email = email
        self.password = password
        self.username = username
    }
}
