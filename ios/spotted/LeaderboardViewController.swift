//
//  LeaderboardViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    let leaderboardLabel = UILabel()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "Leaderboard"
        view.backgroundColor = .white
        
        leaderboardLabel.text = String(score)
        leaderboardLabel.textColor = .black
        leaderboardLabel.textAlignment = .center
        leaderboardLabel.font = .systemFont(ofSize: 25)
        leaderboardLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leaderboardLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            leaderboardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            leaderboardLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leaderboardLabel.widthAnchor.constraint(equalToConstant: 50),
            leaderboardLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension LeaderboardViewController: ChangeTextDelegate {
    func update() {
        self.score += 1
        leaderboardLabel.text = String(score)
    }
}
