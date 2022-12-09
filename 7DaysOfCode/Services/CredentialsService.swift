//
//  CredentialsService.swift
//  7DaysOfCode
//
//  Created by Matheus dos Reis de Jesus on 09/12/22.
//

import Foundation

protocol CredentialServiceProtocol {
    func get<T: Any>(_ key: String) -> T?
}

final class CredentialsService: CredentialServiceProtocol {
    
    private let filename: String
    
    private lazy var keys: [String: String] = {
        guard let fileUrl = Bundle.main.url(forResource: self.filename, withExtension: "plist") else {
            return [:]
        }
        
        do {
            let data = try Data(contentsOf: fileUrl)
            let keys = try PropertyListDecoder().decode([String: String].self, from: data)
            
            return keys
        } catch {
            return [:]
        }
    }()
    
    init(filename: String = "Credentials") {
        self.filename = filename
    }
    
    func get<T>(_ key: String) -> T? {
        return keys[key] as? T
    }
}
