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
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(targetLabel)
        
        playerImageView.image = UIImage(named: "empty-pic")
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(playerImageView)
        
        nameLabel.text = "<name-placeholder>"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameLabel)
        
        gradeLabel.layer.cornerRadius = 15
        gradeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(gradeLabel)
        
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
            nameLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -15)
        ])
    }
}
