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
        setupBackground()
        
        addVC(vc: firstChildVC, bottomDist: 330, sleepTime: 1.5)
        addVC(vc: secondChild, bottomDist: 40, sleepTime: 12.0)
        
        //firstChildVC.hourDelegate = self
    }
    
    private func configureLabel() {
        view.addSubview(label)
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func addVC(vc: UIViewController, bottomDist: CGFloat, sleepTime: Double) {
        addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
       
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            vc.view.heightAnchor.constraint(equalToConstant: 250),
            vc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomDist)
        ])
    }
    
    
    func layoutUI() {
        //var backgroundObject = UIColor(patternImage: UIImage(named: Images.background)!)

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        self.navigationItem.rightBarButtonItem = doneButton
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}


//extension SettingsVC: PassDataToNapDelegate {
//    func timeSelected(napHowLong: Double) {
//        napHour = napHowLong
//        label.text = String(napHour)
//    }
//}
