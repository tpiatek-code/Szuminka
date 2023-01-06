//
//  ViewController.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 20/12/2022.
//


import UIKit
import AVFoundation

class StartVC: UIViewController {
    
    let napButton = TPButton(backgroundColor: .systemGray, title: Constants.napButton)
    let nightButton = TPButton(backgroundColor: .systemGray, title: Constants.nightButton)
    let gearButton = TPGearButton()
    
    var player: AVAudioPlayer?
    var timer: Timer?
    
    let sleepVC = SleepVC()
    let firstVC = FirstChildVC()
    let secondVC = SecondChildVC()
    
    var settingsVC = SettingsVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        layoutUI()
        confActionButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopSound()
    }

    
    @objc func buttonActionNap() {
        sleepTime(title: Constants.napButton)
    }
    
    @objc func buttonActionNight() {
        sleepTime(title: Constants.nightButton)
    }
    
    func sleepTime(title: String) {
        let sleepVC = SleepVC()
        sleepVC.title = title
        let navController = UINavigationController(rootViewController: sleepVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
        playSound()
    }
    
    @objc func gearView() {
        print("SETTINGS VIEW")
        let settingsVC = SettingsVC()
        settingsVC.title = "Settings"
        
        let navController = UINavigationController(rootViewController: settingsVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
        
    }
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: Constants.soundName, withExtension: Constants.soundFormat)

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true)
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            player = try AVAudioPlayer(contentsOf: url!)
            
            guard let player = player else { return }
            
            player.numberOfLoops = -1
            player.play()
            
        } catch {
            print("Sound file error")
        }
    }
    
    
    func stopSound() {
        player?.stop()
    }

    
    @objc func updateLabel() {
        print("Pyk")
    }
    

    func confActionButtons() {
        view.addSubview(napButton)
        view.addSubview(nightButton)
        view.addSubview(gearButton)
        napButton.addTarget(self, action: #selector(buttonActionNap), for: .touchUpInside)
        nightButton.addTarget(self, action: #selector(buttonActionNight), for: .touchUpInside)
        gearButton.addTarget(self, action: #selector(gearView), for: .touchUpInside)
        
        let widthButton:CGFloat = 180
        let heightButton:CGFloat = 60
        
        NSLayoutConstraint.activate([
            napButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            napButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -220),
            napButton.widthAnchor.constraint(equalToConstant: widthButton),
            napButton.heightAnchor.constraint(equalToConstant: heightButton),
            
            nightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nightButton.topAnchor.constraint(equalTo: napButton.bottomAnchor, constant: 20),
            nightButton.widthAnchor.constraint(equalToConstant: widthButton),
            nightButton.heightAnchor.constraint(equalToConstant: heightButton),
            
            gearButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            gearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            gearButton.heightAnchor.constraint(equalToConstant: 50),
            gearButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func layoutUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(dismissVC))
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
 
    
    


}

