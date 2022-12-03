//
//  ScorePopup.swift
//  spotted
//
//  Created by Antoinette Marie Torres on 12/2/22.
//

import UIKit

class ScorePopupViewController: UIViewController {
    
    let centeredView = UIView()
    let pictureImageView = UIImageView()
    let nameLabel = UILabel()
    let rankLabel = UILabel()
    let pointsLabel = UILabel()
    
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
        centeredView.backgroundColor = UIColor(red: 0.74, green: 0.86, blue: 0.38, alpha: 1.0)
        centeredView.frame = CGRect(x: xCoord, y: yCoord, width: 300, height: 300)
        self.view.addSubview(centeredView)
        
        pictureImageView.layer.cornerRadius = 50
        pictureImageView.image = UIImage(named: "leaderboard-profile")
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pictureImageView)
        
        nameLabel.text = "Jennifer"
        nameLabel.font = UIFont(name: "Calibri", size: 40)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        rankLabel.text = "Rank: #24"
        rankLabel.backgroundColor = .white
        rankLabel.layer.cornerRadius = 15
        rankLabel.clipsToBounds = true
        rankLabel.font = UIFont(name: "Calibri", size: 25)
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rankLabel)
        
        pointsLabel.text = "Points: XXP"
        pointsLabel.backgroundColor = .white
        pointsLabel.layer.cornerRadius = 15
        pointsLabel.clipsToBounds = true
        pointsLabel.font = UIFont(name: "Calibri", size: 25)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsLabel)
            
        setupConstraints()
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pictureImageView.topAnchor.constraint(equalTo: centeredView.topAnchor, constant: 20),
            pictureImageView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 20),
            pictureImageView.widthAnchor.constraint(equalToConstant: 100),
            pictureImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: centeredView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: pictureImageView.trailingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            pointsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointsLabel.widthAnchor.constraint(equalToConstant: 220),
            pointsLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            rankLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor, constant: 20),
            rankLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rankLabel.widthAnchor.constraint(equalToConstant: 220),
            rankLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
