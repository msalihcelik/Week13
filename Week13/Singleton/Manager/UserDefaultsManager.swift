//
//  UserDefaultsManager.swift
//  Week13
//
//  Created by Mehmet Salih ÇELİK on 12.01.2022.
//

import Foundation

class UserDefaultsManager: Codable {
    
    static let shared = UserDefaultsManager()
    
    func setData(object: User, key: String) -> Bool {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            // Encode Note
            let data = try encoder.encode(object)
            
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: key)
            UserDefaults.standard.synchronize()
            return true
        } catch {
            print("Unable to Encode User (\(error))")
        }
        return false
    }
    
    func getData<T: Codable>(objectType: T.Type, key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        do {
            // Create JSON Decoder
            let decoder = JSONDecoder()
            
            // Decode Note
            let user = try decoder.decode(T.self, from: data)
            
            return user
        } catch {
            print("Unable to Decode Notes (\(error))")
        }
        return nil
    }
}
