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
    let achievementsLabel = UILabel()
    let awardOneImageView = UIImageView()
    let awardTwoImageView = UIImageView()
    let awardThreeImageView = UIImageView()
    let dismissLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTheView()
    }
    
    private func createTheView() {

        let xCoord = self.view.bounds.width / 2 - 150
        let yCoord = self.view.bounds.height / 2 - 150
        
        centeredView.layer.cornerRadius = 15
        centeredView.backgroundColor = UIColor(red: 0.76, green: 0.14, blue: 0.18, alpha: 1.0)
        centeredView.frame = CGRect(x: xCoord, y: yCoord, width: 300, height: 300)
        self.view.addSubview(centeredView)
        
        targetLabel.text = "- 🔍 Target -"
        targetLabel.font = UIFont(name: "Calibri", size: 25)
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(targetLabel)
        
        playerImageView.image = UIImage(named: "empty-pic")
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(playerImageView)
        
        nameLabel.text = "<name-placeholder>"
        nameLabel.font = UIFont(name: "Calibri", size: 20)
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
        
        setUpConstraints()
        
        }
        
    func setUpConstraints() {
        
        //targetLabel
        NSLayoutConstraint.activate([
            targetLabel.topAnchor.constraint(equalTo: centeredView.safeAreaLayoutGuide.topAnchor, constant: 15),
            targetLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
        ])
        
        //playerImageView
        NSLayoutConstraint.activate([
            playerImageView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 15),
            playerImageView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 15),
            playerImageView.widthAnchor.constraint(equalToConstant: 100),
            playerImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        //nameLabel
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            dismissLabel.topAnchor.constraint(equalTo: centeredView.bottomAnchor, constant: -25),
            dismissLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
        ])
    }
}
