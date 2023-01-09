//
//  PersistanceManager.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 06/01/2023.
//

import Foundation

struct Persistancemanager {
    
    private let defaults = UserDefaults.standard
    
    
    
    func saveData(data: Double) {
        defaults.set(data, forKey: "nap")
    }
    
    func retrieveData() -> Double {
        let data = defaults.double(forKey: "nap")
        return data
    }
    
}
