//
//  FirstChildVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 05/01/2023.
//

import UIKit

class FirstChildVC: ParentVC {
    
    let napArray: [String] = ["0.01 h test", "0.5 h", "1 h", "1.5 h", "2 h", "2.5 h", "3 h"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerUI()
        configureLabel(labelName: Constants.setupNapButton)
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
            
            UserDefaults.standard.set(row, forKey: "pickerViewRowNap")
        }

    }
}
