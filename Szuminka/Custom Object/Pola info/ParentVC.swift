//
//  ParentVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 09/01/2023.
//

import UIKit

class ParentVC: UIViewController {
    
    var label = UILabel()
    var customPicker = UIPickerView()
    
    //weak var hourDelegate: PassDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
    }
    
    func configurePickerUI() {
        customPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customPicker)
        
        let padding: CGFloat = 40
        
        NSLayoutConstraint.activate([
            
            customPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            customPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            customPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            customPicker.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureBackground() {
        view.layer.cornerRadius = 20
        view.backgroundColor = CustomColors.granatLight
    }
    
    func configureLabel(labelName: String) {
        view.addSubview(label)
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = labelName
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
