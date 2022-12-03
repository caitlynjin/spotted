//
//  LeaderboardViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    let titleLabel = UILabel()
    let firstPlaceLabel = UILabel()
    let secondPlaceLabel = UILabel()
    let thirdPlaceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)

        titleLabel.text = "This Week's Rankings"
        titleLabel.font = UIFont(name: "Valken", size: 30)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        firstPlaceLabel.text = "<user name>"
        firstPlaceLabel.textColor = .white
        firstPlaceLabel.textAlignment = .center
        firstPlaceLabel.font = UIFont(name: "Calibri", size: 25)
        firstPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstPlaceLabel)
        
        secondPlaceLabel.text = "<user name>"
        secondPlaceLabel.textColor = .white
        secondPlaceLabel.textAlignment = .center
        secondPlaceLabel.font = UIFont(name: "Calibri", size: 25)
        secondPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondPlaceLabel)
        
        thirdPlaceLabel.text = "<user name>"
        thirdPlaceLabel.textColor = .white
        thirdPlaceLabel.textAlignment = .center
        thirdPlaceLabel.font = UIFont(name: "Calibri", size: 25)
        thirdPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(thirdPlaceLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            firstPlaceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            firstPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstPlaceLabel.widthAnchor.constraint(equalToConstant: 150),
            firstPlaceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            secondPlaceLabel.topAnchor.constraint(equalTo: firstPlaceLabel.bottomAnchor, constant: 15),
            secondPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondPlaceLabel.widthAnchor.constraint(equalToConstant: 150),
            secondPlaceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            thirdPlaceLabel.topAnchor.constraint(equalTo: secondPlaceLabel.bottomAnchor, constant: 15),
            thirdPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdPlaceLabel.widthAnchor.constraint(equalToConstant: 150),
            thirdPlaceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
