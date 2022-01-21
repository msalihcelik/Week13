//
//  UserBuilder.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 18.01.2022.
//

import Foundation

class UserBuilder {
    
    private var user = User(name: "", surname: "", email: "", password: "", username: "")
    
    func setName(_ name: String) -> UserBuilder {
        user.name = name
        return self
    }
    
    func setSurname(_ surname: String) -> UserBuilder {
        user.surname = surname
        return self
    }
    
    func setEmail(_ email: String) -> UserBuilder {
        user.email = email
        return self
    }
    
    func setPassword(_ password: String) -> UserBuilder {
        user.password = password
        return self
    }
    
    func setUserName(_ username: String) -> UserBuilder {
        user.username = username
        return self
    }
    
    func build() -> User {
        return user
    }
}
