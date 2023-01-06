//
//  TPButton.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 20/12/2022.
//

import UIKit

class TPButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        confButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        confButton()
    }
    
    private func confButton() {
        layer.cornerRadius = 10
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 100

        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
