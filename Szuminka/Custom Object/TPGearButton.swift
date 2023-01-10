//
//  TPGearButton.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 21/12/2022.
//

import UIKit

class TPGearButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        //setImage(UIImage(systemName: "gearshape"), for: .normal)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .thin, scale: .large)
        let largeBoldDoc = UIImage(systemName: "gearshape", withConfiguration: largeConfig)
        setImage(largeBoldDoc, for: .normal)
        
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
