//
//  FirstChildVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 05/01/2023.
//

import UIKit

protocol PassDataDelegate: AnyObject {
    func timeSelected(howLong: Double)
}


class FirstChildVC: UIViewController {
    
    var label = UILabel()
    var buttonTest = TPButton(backgroundColor: .systemPink, title: "test button")
    
    weak var hourDelegate: PassDataDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBackground()
        configureLabel()
        confActionButton()

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
        label.text = Constants.napButton
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func confActionButton() {
        view.addSubview(buttonTest)
        
        buttonTest.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        let widthButton:CGFloat = 180
        let heightButton:CGFloat = 60
        
        NSLayoutConstraint.activate([
            buttonTest.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTest.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            buttonTest.widthAnchor.constraint(equalToConstant: widthButton),
            buttonTest.heightAnchor.constraint(equalToConstant: heightButton),

        ])
    }
    
    @objc func buttonAction() {
        hourDelegate?.timeSelected(howLong: 5.0)
        print("Button pressed")
        

    }
}

