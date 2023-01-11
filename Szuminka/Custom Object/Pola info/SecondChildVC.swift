//
//  SecondChildVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 05/01/2023.
//

import UIKit

class SecondChildVC: ParentVC {
    
    let nightArray: [String] = ["7 h", "8 h", "9 h", "10 h", "11 h", "12 h"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerUI()
        configureLabel(labelName: Constants.setupNightButton)
    }
    
    override func configurePickerUI() {
        super.configurePickerUI()
        
        DispatchQueue.main.async {
            let row = UserDefaults.standard.integer(forKey: "pickerViewRowNight")
            self.customPicker.selectRow(row, inComponent: 0, animated: false)
        }
        
        customPicker.delegate = self
        customPicker.dataSource = self
    }
}

extension SecondChildVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nightArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(nightArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DispatchQueue.main.async {
            let defaults = UserDefaults.standard
            defaults.set(self.nightArray[row], forKey: "night")
            
            //let row = self.nightArray[row]
            UserDefaults.standard.set(row, forKey: "pickerViewRowNight")
        }
        
        //hourDelegate?.timeSelected(napHowLong: napArray[row])
    }
    
    
    
}

