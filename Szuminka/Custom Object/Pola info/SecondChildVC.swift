//
//  SecondChildVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 05/01/2023.
//

import UIKit

class SecondChildVC: UIViewController {
    
    var label = UILabel()
    
    var sleepTime = 12.0

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBackground()
        configureLabel()
    }
    
    private func configureBackground() {
        view.layer.cornerRadius = 20
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureLabel() {
        view.addSubview(label)
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = Constants.nightButton
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    


}
