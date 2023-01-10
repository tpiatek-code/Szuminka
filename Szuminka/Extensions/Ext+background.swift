//
//  Ext+background.swift
//  Szuminka
//
//  Created by Tomasz Piątek on 06/01/2023.
//

import UIKit

extension UIViewController {
    
    func setupBackground(image: String) {
        let imageView: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: image)
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        view.insertSubview(imageView, at: 0)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupGradientBackground() {
        var gradient = CustomColors.gradientBackground
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
}

