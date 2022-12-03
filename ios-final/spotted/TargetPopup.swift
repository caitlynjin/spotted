//
//  Target-Popup.swift
//  spotted
//
//  Created by Antoinette Marie Torres on 11/30/22.
//

import UIKit

class TargetPopupViewController: UIViewController {
    
    let centeredView = UIView()
    let targetLabel = UILabel()
    let playerImageView = UIImageView()
    let nameLabel = UILabel()
    let gradeLabel = UILabel()
    let schoolLabel = UILabel()
    let levelLabel = UILabel()
    let dismissLabel = UILabel()
    let gameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTheView()
    }
    
    private func createTheView() {

        let xCoord = self.view.bounds.width / 2 - 150
        let yCoord = self.view.bounds.height / 2 - 150
        
        centeredView.layer.cornerRadius = 15
        centeredView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        centeredView.layer.borderWidth = 7
        centeredView.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)
        centeredView.frame = CGRect(x: xCoord, y: yCoord, width: 300, height: 300)
        self.view.addSubview(centeredView)
        
        targetLabel.text = "- 🔍 Target -"
        targetLabel.textColor = .white
        targetLabel.font = UIFont(name: "Calibri", size: 25)
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(targetLabel)
        
        playerImageView.image = UIImage(named: "target-profile-pic")
        playerImageView.layer.cornerRadius = 70
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(playerImageView)
        
        nameLabel.text = "Jennifer"
        nameLabel.font = UIFont(name: "Calibri", size: 45)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameLabel)
        
        gradeLabel.layer.cornerRadius = 15
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(gradeLabel)
        
        dismissLabel.text = "swipe down to dismiss"
        dismissLabel.font = UIFont(name: "Calibri", size: 15)
        dismissLabel.textAlignment = .center
        dismissLabel.layer.cornerRadius = 15
        dismissLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dismissLabel)
        
        levelLabel.text = "Lo Moth 🦋"
        levelLabel.textAlignment = .center
        levelLabel.textColor = .white
        levelLabel.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        levelLabel.layer.cornerRadius = 15
        levelLabel.layer.masksToBounds = true
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelLabel)
        
        gameLabel.text = "Game: HOTELIE"
        gameLabel.textAlignment = .center
        gameLabel.textColor = .white
        gameLabel.backgroundColor = UIColor(red: 0.61, green: 0.31, blue: 1.0, alpha: 1.0)
        gameLabel.layer.cornerRadius = 15
        gameLabel.layer.masksToBounds = true
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameLabel)
        
        setUpConstraints()
        
        }
        
    func setUpConstraints() {
        
        //targetLabel
        NSLayoutConstraint.activate([
            targetLabel.topAnchor.constraint(equalTo: centeredView.safeAreaLayoutGuide.topAnchor, constant: 20),
            targetLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
        ])
        
        //playerImageView
        NSLayoutConstraint.activate([
            playerImageView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 10),
            playerImageView.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor),
//            playerImageView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 15),
            playerImageView.widthAnchor.constraint(equalToConstant: 140),
            playerImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        //nameLabel
        NSLayoutConstraint.activate([
            levelLabel.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: -5),
            levelLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor),
            levelLabel.heightAnchor.constraint(equalToConstant: 30),
            levelLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        //nameLabel
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
//            nameLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            dismissLabel.topAnchor.constraint(equalTo: centeredView.bottomAnchor, constant: -25),
            dismissLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
        ])
        //nameLabel
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: dismissLabel.bottomAnchor),
            gameLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor),
            gameLabel.heightAnchor.constraint(equalToConstant: 30),
            gameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
