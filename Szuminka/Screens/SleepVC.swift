//
//  SleepVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 20/12/2022.
//

import UIKit

class SleepVC: UIViewController {
    
    var timeLabel: UILabel!
    var timer: Timer?
    
    var settingsVC = SettingsVC()
    let firstChildVC = FirstChildVC()
    
    var hour = 0
    var mins = 0
    var secs = 0
    
    var napHour: Double!
    var nightHour: Double!
    
    var label = UILabel()
    
    var data: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutUI()
        configureLabelUI()
        
        checkForKind()
        
    }
    
    func checkForKind() {
        if title == Constants.napButton {
            convertHours(hours: napHour)
        } else if title == Constants.nightButton {
            convertHours(hours: nightHour)
        }
        
    }

    
//    private func configureLabel() {
//        view.addSubview(label)
//
//        label.textAlignment = .center
//        label.textColor = .label
//        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        label.text = "placeholder"
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//
//    }
    
    
    func convertHours(hours: Double) {
        let difference = hours * 3600
        
        if difference > 0 {
            let computedHours: Double = Double(difference) / 3600
            let remainder: Double = Double(difference) - (computedHours * 3600)
            let minutes: Double = remainder / 60
            let seconds: Double = Double(difference) - (computedHours * 3600) - (minutes * 60)

            hour = Int(computedHours)
            mins = Int(minutes)
            secs = Int(seconds)

            calculateLabel()
        }

    }
    
    private func calculateLabel() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            if self.secs > 0 {
                self.secs = self.secs - 1
            }
            else if self.mins > 0 && self.secs == 0 {
                self.mins = self.mins - 1
                self.secs = 59
            }
            else if self.hour > 0 && self.mins == 0 && self.secs == 0 {
                self.hour = self.hour - 1
                self.mins = 59
                self.secs = 59
            }
            
            let labelCount = "\(self.hour):\(self.mins):\(self.secs)"
            self.updateLabel(count: labelCount)


            
            if self.hour == 0 && self.mins == 0 && self.secs == 0 {
                self.timer?.invalidate()
                self.dismissVC()
            }
            
        })
        
    }
    
    
    private func updateLabel(count: String) {
        timeLabel.text = count
    }
    
   
    func configureLabelUI() {
        timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        
        timeLabel.text = "TIME START!"
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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



