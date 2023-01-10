//
//  Colors.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 06/01/2023.
//

import UIKit

struct CustomColors {
    //buttons
    static var granat       = UIColor(red: 0.04, green: 0.06, blue: 0.08, alpha: 1.0)
    static var granatLight  = UIColor(red: 0.0, green: 0.2, blue: 0.35, alpha: 1.0)
    static let navyButton   = UIColor(red: 0.039, green: 0.0628, blue: 0.145, alpha: 1.0)
    
    //navyBlue
    static var navyBlueDark  = UIColor(red: 0.0, green: 0.15, blue: 0.3, alpha: 1.0)
    static var navyBlue     = UIColor(red: 0.0, green: 0.05, blue: 0.1, alpha: 1.0)
    
    //Labels
    static var greyLabels   = UIColor.systemGray
    
    //gradient background
    static var gradientBackground: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            CustomColors.navyBlue.cgColor,
            CustomColors.navyBlueDark.cgColor
        ]
        gradient.type = .axial
        gradient.locations = [0, 1]
        return gradient
    }()
        
}
