//
//  FirstChildVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 05/01/2023.
//

import UIKit

class FirstChildVC: ParentVC {
    
    let napArray = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0]
    
//    weak var hourDelegate: PassDataToNapDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerUI()
        configureLabel(labelName: Constants.napButton)
    }
    
    override func configurePickerUI() {
        super.configurePickerUI()
        
        DispatchQueue.main.async {
            let row = UserDefaults.standard.integer(forKey: "pickerViewRowNap")
            self.customPicker.selectRow(row, inComponent: 0, animated: false)
        }
        
        customPicker.delegate = self
        customPicker.dataSource = self
    }
    
}

extension FirstChildVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return napArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(napArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DispatchQueue.main.async {
            let defaults = UserDefaults.standard
            defaults.set(self.napArray[row], forKey: "nap")
            
            //let row = self.napArray[row]
            UserDefaults.standard.set(row, forKey: "pickerViewRowNap")
        }
        //hourDelegate?.timeSelected(napHowLong: napArray[row])
        
    }
}
