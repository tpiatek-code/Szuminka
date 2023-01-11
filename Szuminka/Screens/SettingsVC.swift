//
//  SettingsVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 21/12/2022.
//

import UIKit



class SettingsVC: UIViewController {
    
    var napHour: Double!
    
    var label = UILabel()
    
    var firstChildVC = FirstChildVC()
    let secondChild = SecondChildVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        setupBackground(image: Images.settingsBackground)
        configureBar()
        
        addVC(vc: firstChildVC, bottomDist: 280, sleepTime: 1.5)
        addVC(vc: secondChild, bottomDist: 40, sleepTime: 12.0)
    }
    
    func configureBar() {
        navigationController?.navigationBar.tintColor = CustomColors.greyLabels
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColors.greyLabels]
    }
    
    
    func addVC(vc: UIViewController, bottomDist: CGFloat, sleepTime: Double) {
        addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
       
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.heightAnchor.constraint(equalToConstant: 200),
            vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomDist)
        ])
    }
    
    
    func layoutUI() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        self.navigationItem.rightBarButtonItem = doneButton
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
