//
//  CommunityViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/26/22.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    let titleLabel = UILabel()
    let helpLabel = UILabel()
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)
        
        titleLabel.text = "Instructions"
        titleLabel.font = UIFont(name: "Valken", size: 30)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        helpLabel.text = "1. After you’ve signed in, set up your profile. You must include you schedule, profile photo, and reference photo before you can start playing.\n\n" +
            "2. Next, find a game to join! You can either join an existing community or start one of your own. \n\n" +
            "3. Congrats! Now you can start spotting. Reference the target card to access your target’s name, photo, and schedule. They might also include a hint! \n\n" +
            "4. Games occur on a weekly basis. You have a week to spot as many targets as you can. Take a clear photo of your target. But be careful! They can’t catch you taking it. You can view your own photos and others through profiles in the personal feed. \n\n" +
            "5. Play each week and level up! With each level comes a new badge. All beginners start off as ladybugs. The highest level you can reach is the beautiful peacock butterfly with four spotted wings. \n\n" +
            "6. Best of luck! May the best spotter win :)"
        helpLabel.font = UIFont(name: "Calibri", size: 20)
        helpLabel.textColor = .white
        helpLabel.lineBreakMode = .byWordWrapping
        helpLabel.numberOfLines = 0
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(helpLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            helpLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -10.0),
            helpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            helpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            helpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
}
