//
//  Keychain.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 10/11/23.
//

import KeychainSwift


public protocol KeychainManagerProtocol {
    func save(key: String, value: String) -> Bool
    func load(key: String) -> String?
    func deleteToken(key: String) -> Bool
}
// MARK: Class
class KeychainManager: KeychainManagerProtocol  {
    private let keychain = KeychainSwift()
    
  func save(key: String, value: String) -> Bool {
        if let data = value.data(using: .utf8){
            return keychain.set(data, forKey: key)
        }else {
            return false
        }
        
    }
    
    func load(key: String) -> String? {
        if let data = keychain.get(key){
            return data
        }else {
            return ""
        }
    }
    func deleteToken(key: String) -> Bool {
        keychain.delete(key)
    }
}
