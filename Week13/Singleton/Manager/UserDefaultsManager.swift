//
//  UserDefaultsManager.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 12.01.2022.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    func setData(value: String, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func getData(key: String) -> Any? {
      return UserDefaults.standard.value(forKey: key)
    }
}
