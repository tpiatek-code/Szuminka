//
//  Calculations.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 21/12/2022.
//

import Foundation

struct Calculations {
    
    var numberOfHours: Double
    
    init(numberOfHours: Double) {
        self.numberOfHours = numberOfHours
    }
    
    
    func secondsCount() -> Double {
        let seconds = ((numberOfHours * 60) * 60)
        print("Seconds count: \(seconds)")
        return seconds
    }
    
}


