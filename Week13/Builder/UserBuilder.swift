//
//  UserBuilder.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 18.01.2022.
//

import Foundation

class UserBuilder {
    
    private var name = ""
    private var surname = ""
    private var email = ""
    private var password = ""
    private var username = ""
    
    func setName(_ name: String) -> UserBuilder {
        self.name = name
        return self
    }
    
    func setSurname(_ surname: String) -> UserBuilder {
        self.surname = surname
        return self
    }
    
    func setEmail(_ email: String) -> UserBuilder {
        self.email = email
        return self
    }
    
    func setPassword(_ password: String) -> UserBuilder {
        self.password = password
        return self
    }
    
    func setUserName(_ username: String) -> UserBuilder {
        self.username = username
        return self
    }
    
    func build() -> User {
        return User(name: self.name,
                    surname: self.surname,
                    email: self.email,
                    password: self.password,
                    username: self.username)
    }
}
