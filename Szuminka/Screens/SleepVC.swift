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
    
    var count: Double!
    
    var napHour: Double!
    var nightHour: Double!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground(image: Images.sleepBackground)
        layoutUI()
        configureLabelUI()
        checkForKind()
    }
    
    func checkForKind() {
        if title == Constants.napButton {
            convertHourToSecond(hour: napHour)
        } else if title == Constants.nightButton {
            convertHourToSecond(hour: nightHour)
        }
    }
    
    
    func convertHourToSecond(hour: Double) {
        count = hour * 3600
        calculationLabelNew()
    }
    
    func calculationLabelNew() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() {
        guard count > 0 else {
            self.timer?.invalidate()
            self.dismissVC()
            return
        }
        
        count = count - 1
        let time = secondsToHoursMinutesSeconds(seconds: Int(count))
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
   
    func configureLabelUI() {
        timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.text = "TIME START!"
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    
    func layoutUI() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        self.navigationItem.rightBarButtonItem = doneButton
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}



