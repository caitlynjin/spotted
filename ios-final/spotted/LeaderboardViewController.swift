//
//  LeaderboardViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    let thisWeekTitleLabel = UILabel()
    let rankingTitleLabel = UILabel()
    let rankingImageView = UIImageView()
    let fourthPlaceLabel = UILabel()
    let fifthPlaceLabel = UILabel()
    let sixthPlaceLabel = UILabel()
    let myScoreLabel = UILabel()
    let scoreButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)

        thisWeekTitleLabel.text = "This Week's"
        thisWeekTitleLabel.font = UIFont(name: "Valken", size: 30)
        thisWeekTitleLabel.textAlignment = .center
        thisWeekTitleLabel.textColor = .white
        thisWeekTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(thisWeekTitleLabel)
        
        rankingTitleLabel.text = "Rankings"
        rankingTitleLabel.font = UIFont(name: "Valken", size: 30)
        rankingTitleLabel.textAlignment = .center
        rankingTitleLabel.textColor = .white
        rankingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rankingTitleLabel)
        
        rankingImageView.image = UIImage(named: "ranking-image")
        rankingImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rankingImageView)
        
        fourthPlaceLabel.text = "4    Daniel          XXP"
        fourthPlaceLabel.textColor = .white
        fourthPlaceLabel.textAlignment = .center
        fourthPlaceLabel.font = UIFont(name: "Calibri", size: 30)
        fourthPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fourthPlaceLabel)

        fifthPlaceLabel.text = "5    Luke             XXP"
        fifthPlaceLabel.textColor = .white
        fifthPlaceLabel.textAlignment = .center
        fifthPlaceLabel.font = UIFont(name: "Calibri", size: 30)
        fifthPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fifthPlaceLabel)

        sixthPlaceLabel.text = "6    Sarah           XXP"
        sixthPlaceLabel.textColor = .white
        sixthPlaceLabel.textAlignment = .center
        sixthPlaceLabel.font = UIFont(name: "Calibri", size: 30)
        sixthPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sixthPlaceLabel)
        
        scoreButton.clipsToBounds = true
        scoreButton.layer.cornerRadius = 35
        scoreButton.setImage(UIImage(named: "view-score-button"), for: .normal)
        scoreButton.addTarget(self, action: #selector(showScore), for: .touchUpInside)
        scoreButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreButton)
        
        myScoreLabel.text = "My Score"
        myScoreLabel.textColor = .white
        myScoreLabel.font = UIFont(name: "Calibri", size: 15)
        myScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myScoreLabel)
        
        setupConstraints()
    }
    
    @objc func showScore() {
        print("please fucking work")
        let vc = ScorePopupViewController()
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(ScorePopupViewController(), animated: true, completion: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            thisWeekTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            thisWeekTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thisWeekTitleLabel.widthAnchor.constraint(equalToConstant: 200),
            thisWeekTitleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            rankingTitleLabel.topAnchor.constraint(equalTo: thisWeekTitleLabel.bottomAnchor),
            rankingTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rankingTitleLabel.widthAnchor.constraint(equalToConstant: 200),
            rankingTitleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            scoreButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            scoreButton.heightAnchor.constraint(equalToConstant: 70),
            scoreButton.widthAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            myScoreLabel.topAnchor.constraint(equalTo: scoreButton.bottomAnchor, constant: 5),
            myScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
        
        NSLayoutConstraint.activate([
            rankingImageView.topAnchor.constraint(equalTo: rankingTitleLabel.bottomAnchor, constant: 40),
            rankingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rankingImageView.heightAnchor.constraint(equalToConstant: 320),
            rankingImageView.widthAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            fourthPlaceLabel.topAnchor.constraint(equalTo: rankingImageView.bottomAnchor, constant: 25),
            fourthPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthPlaceLabel.widthAnchor.constraint(equalToConstant: 300),
            fourthPlaceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            fifthPlaceLabel.topAnchor.constraint(equalTo: fourthPlaceLabel.bottomAnchor, constant: 25),
            fifthPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fifthPlaceLabel.widthAnchor.constraint(equalToConstant: 300),
            fifthPlaceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            sixthPlaceLabel.topAnchor.constraint(equalTo: fifthPlaceLabel.bottomAnchor, constant: 25),
            sixthPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sixthPlaceLabel.widthAnchor.constraint(equalToConstant: 300),
            sixthPlaceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
