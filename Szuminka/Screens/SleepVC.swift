//
//  SleepVC.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 20/12/2022.
//

import UIKit

class SleepVC: UIViewController {
    
    let doneButton = TPButton(backgroundColor: CustomColors.granat, title: Constants.doneButton)
    
    var timeLabel: UILabel!
    var timer: Timer?
    
    var count: Double!
    
    var napHour: Double!
    var nightHour: Double!
    var countHour: Double!
    
    let shape = CAShapeLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground(image: Images.sleepBackground)
        layoutUI()
        configureLabelUI()
        confActionButtons()
        checkForKind()
        
        circleProgressBar()
    }
    
    
    func secondsCount(hours: Double) -> Double {
        let seconds = hours * 3600
        return seconds
    }
    
    
    func checkForKind() {
        if title == Constants.napButton {
            countHour = napHour
        } else if title == Constants.nightButton {
            countHour = nightHour
        }
        convertHourToSecond(hour: countHour)
    }
    
    
    func convertHourToSecond(hour: Double) {
        count = secondsCount(hours: hour)
        calculationLabelNew()
    }
    
    
    func calculationLabelNew() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    
    @objc func timerCounter() {
        guard count > 1 else {
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
    
    
    //MARK: - Circle progress bar
    
    
    func circleProgressBar() {
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 130, startAngle: -(.pi / 2), endAngle: .pi * 1.5, clockwise: true)
        let lineWidth:CGFloat = 2
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = lineWidth
        trackShape.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = lineWidth
        shape.strokeColor = CustomColors.greyLabels.cgColor
        shape.strokeEnd = 0
        shape.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shape)
        
        startAnimation(duration: secondsCount(hours: countHour))
    }
    
    
    func startAnimation(duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = duration
        shape.add(animation, forKey: "animation")
        
    }
    
    
    //MARK: - UI confuguration
    
    
    func layoutUI() {
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
//        self.navigationItem.rightBarButtonItem = doneButton
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = CustomColors.greyLabels
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: CustomColors.greyLabels]
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    
    func configureLabelUI() {
        timeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        timeLabel.font = UIFont.systemFont(ofSize: 30)
        timeLabel.textColor = CustomColors.greyLabels
        timeLabel.text = "TIME START!"
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func confActionButtons() {
        view.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        
        let widthButton:CGFloat = 200
        let heightButton:CGFloat = 80
        
        NSLayoutConstraint.activate([
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            doneButton.widthAnchor.constraint(equalToConstant: widthButton),
            doneButton.heightAnchor.constraint(equalToConstant: heightButton)
        ])
    }
    
    @objc func doneButtonAction() {
        dismissVC()
    }
    
    
    
}
