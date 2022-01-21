//
//  User.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 18.01.2022.
//

import Foundation

struct User: Codable {
    
    var name: String
    var surname: String
    var email: String
    var password: String
    var username: String
    
    init(name: String, surname: String, email: String, password: String, username: String) {
        self.name = name
        self.surname = surname
        self.email = email
        self.password = password
        self.username = username
    }
}
