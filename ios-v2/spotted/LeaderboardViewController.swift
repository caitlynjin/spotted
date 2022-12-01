//
//  LeaderboardViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    let firstPlaceLabel = UILabel()
    let secondPlaceLabel = UILabel()
    let thirdPlaceLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        firstPlaceLabel.text = "<user name>"
        firstPlaceLabel.textColor = .black
        firstPlaceLabel.textAlignment = .center
        firstPlaceLabel.font = .systemFont(ofSize: 20)
        firstPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstPlaceLabel)
        
        secondPlaceLabel.text = "<user name>"
        secondPlaceLabel.textColor = .black
        secondPlaceLabel.textAlignment = .center
        secondPlaceLabel.font = .systemFont(ofSize: 20)
        secondPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondPlaceLabel)
        
        thirdPlaceLabel.text = "<user name>"
        thirdPlaceLabel.textColor = .black
        thirdPlaceLabel.textAlignment = .center
        thirdPlaceLabel.font = .systemFont(ofSize: 20)
        thirdPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(thirdPlaceLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstPlaceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
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
