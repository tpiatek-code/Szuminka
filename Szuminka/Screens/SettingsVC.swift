//
//  SettingsVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 21/12/2022.
//

import UIKit



class SettingsVC: UIViewController {
    
    var napHour: Double!
    var nightHour: Double!
    
    var label = UILabel()
    
    let napArray = [0.5, 1, 1.5, 2, 2.5, 3]
    
    
    var firstChild = FirstChildVC()
    let secondChild = SecondChildVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configureLabel()
        
        addVC(vc: firstChild, bottomDist: 40, sleepTime: 1.5)
        addVC(vc: secondChild, bottomDist: 330, sleepTime: 12.0)
        
        firstChild.hourDelegate = self

    }
    

//    private func configurePickerUI() {
//        let napPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        napPicker.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(napPicker)
//        napPicker.delegate = self
//        napPicker.dataSource = self
//
//        NSLayoutConstraint.activate([
//            napPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
//            napPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
//            napPicker.heightAnchor.constraint(equalToConstant: 120)
//        ])
//    }
    

    
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
        view.backgroundColor = .systemGray
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        self.navigationItem.rightBarButtonItem = doneButton
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}


extension SettingsVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return napArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let stringNapArray = napArray.map { String($0)}
        return stringNapArray[row]
    }
    
}

extension SettingsVC: PassDataDelegate {
    func timeSelected(howLong: Double) {
        napHour = howLong
        label.text = String(napHour)
    }
}
