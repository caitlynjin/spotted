//
//  joinGameViewController.swift
//  spotted
//
//  Created by Antoinette Marie Torres on 12/2/22.
//

import UIKit

class joinGameViewController: UIViewController {
    
    let joinLabel = UILabel()
    let existingButton = UIButton()
    let existingLabel = UILabel()
    let startOwnButton = UIButton()
    let startOwnLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)

        joinLabel.text = "Join A New Game"
        joinLabel.textColor = .black
        joinLabel.font = UIFont(name: "Calibri", size: 30)
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(joinLabel)
        
        existingButton.setImage(UIImage(named: "existing-game"), for: .normal)
        existingButton.layer.cornerRadius = 15
        existingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(existingButton)
        
        existingLabel.text = "Existing Game"
        existingLabel.textColor = .black
        existingLabel.textAlignment = .center
        existingLabel.font = UIFont(name: "Calibri", size: 20)
        existingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(existingLabel)
        
        startOwnButton.setImage(UIImage(named: "start-game"), for: .normal)
        startOwnButton.layer.cornerRadius = 15
        startOwnButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startOwnButton)
        
        startOwnLabel.text = "Start a New Game"
        startOwnLabel.textColor = .black
        startOwnLabel.textAlignment = .center
        startOwnLabel.font = UIFont(name: "Calibri", size: 20)
        startOwnLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startOwnLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            joinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            joinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            existingButton.topAnchor.constraint(equalTo: joinLabel.bottomAnchor, constant: 25),
            existingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            existingButton.heightAnchor.constraint(equalToConstant: 200),
            existingButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            existingLabel.topAnchor.constraint(equalTo: existingButton.bottomAnchor, constant: 5),
            existingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            existingLabel.heightAnchor.constraint(equalToConstant: 50),
            existingLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            startOwnButton.topAnchor.constraint(equalTo: existingLabel.bottomAnchor, constant: 5),
            startOwnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startOwnButton.heightAnchor.constraint(equalToConstant: 200),
            startOwnButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            startOwnLabel.topAnchor.constraint(equalTo: startOwnButton.bottomAnchor, constant: 5),
            startOwnLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startOwnLabel.heightAnchor.constraint(equalToConstant: 50),
            startOwnLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
