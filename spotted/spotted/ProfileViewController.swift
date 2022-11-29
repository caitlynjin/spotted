//
//  ProfileViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let profileNameLabel = UILabel()
    let progressLabel = UILabel()
    let galleryButton = UIButton()
    let badgesButton = UIButton()
    let targetButton = UIButton()
    let communityButton = UIButton()
    let joinGameButton = UIButton()
    let scheduleButton = UIButton()
    let logOutButton = UIButton()
    let editProfileButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.layer.cornerRadius = 75
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        profileNameLabel.text = "<user name>"
        profileNameLabel.font = .systemFont(ofSize: 20)
        profileNameLabel.textAlignment = .center
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileNameLabel)
        
        progressLabel.text = "<progress tracker>"
        progressLabel.backgroundColor = .systemGray6
        progressLabel.clipsToBounds = true
        progressLabel.font = .systemFont(ofSize: 15)
        progressLabel.layer.cornerRadius = 15
        progressLabel.layer.borderWidth = 2
        progressLabel.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressLabel)
        
        galleryButton.setImage(UIImage(named: "placeholder"), for: .normal)
        galleryButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        galleryButton.layer.borderWidth = 2
        galleryButton.layer.cornerRadius = 15
        galleryButton.clipsToBounds = true
        galleryButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(galleryButton)
        
        badgesButton.setImage(UIImage(named: "placeholder"), for: .normal)
        badgesButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        badgesButton.layer.borderWidth = 2
        badgesButton.layer.cornerRadius = 15
        badgesButton.clipsToBounds = true
        badgesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(badgesButton)
        
        targetButton.setImage(UIImage(named: "placeholder"), for: .normal)
        targetButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        targetButton.layer.borderWidth = 2
        targetButton.layer.cornerRadius = 15
        targetButton.clipsToBounds = true
        targetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(targetButton)
        
        communityButton.setImage(UIImage(named: "placeholder"), for: .normal)
        communityButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        communityButton.layer.borderWidth = 2
        communityButton.layer.cornerRadius = 15
        communityButton.clipsToBounds = true
        communityButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(communityButton)
        
        joinGameButton.setImage(UIImage(named: "placeholder"), for: .normal)
        joinGameButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        joinGameButton.layer.borderWidth = 2
        joinGameButton.layer.cornerRadius = 30
        joinGameButton.clipsToBounds = true
        joinGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(joinGameButton)
        
        scheduleButton.setImage(UIImage(named: "placeholder"), for: .normal)
        scheduleButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        scheduleButton.layer.borderWidth = 2
        scheduleButton.layer.cornerRadius = 30
        scheduleButton.clipsToBounds = true
        scheduleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scheduleButton)
        
        logOutButton.setImage(UIImage(named: "placeholder"), for: .normal)
        logOutButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        logOutButton.layer.borderWidth = 2
        logOutButton.layer.cornerRadius = 30
        logOutButton.clipsToBounds = true
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logOutButton)
        
        editProfileButton.setImage(UIImage(named: "placeholder"), for: .normal)
        editProfileButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        editProfileButton.layer.borderWidth = 2
        editProfileButton.layer.cornerRadius = 30
        editProfileButton.clipsToBounds = true
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)
        
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //profileImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            profileImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            profileNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            profileNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileNameLabel.widthAnchor.constraint(equalToConstant: 200),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 10),
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            progressLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            galleryButton.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 15),
            galleryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            galleryButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            galleryButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
        ])
        NSLayoutConstraint.activate([
            badgesButton.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 15),
            badgesButton.leadingAnchor.constraint(equalTo: galleryButton.trailingAnchor, constant: 10),
            badgesButton.widthAnchor.constraint(equalTo: galleryButton.widthAnchor, multiplier: 0.45),
            badgesButton.heightAnchor.constraint(equalTo: galleryButton.heightAnchor, multiplier: 0.45)
                ])
        NSLayoutConstraint.activate([
            targetButton.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 15),
            targetButton.leadingAnchor.constraint(equalTo: badgesButton.trailingAnchor, constant: 10),
            targetButton.widthAnchor.constraint(equalTo: badgesButton.widthAnchor),
            targetButton.heightAnchor.constraint(equalTo: badgesButton.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            communityButton.topAnchor.constraint(equalTo: badgesButton.bottomAnchor, constant: 10),
            communityButton.leadingAnchor.constraint(equalTo: galleryButton.trailingAnchor, constant: 10),
            communityButton.widthAnchor.constraint(equalTo: galleryButton.widthAnchor, multiplier: 0.45),
            communityButton.heightAnchor.constraint(equalTo: galleryButton.heightAnchor, multiplier: 0.45)
        ])
        NSLayoutConstraint.activate([
            joinGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            joinGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            joinGameButton.widthAnchor.constraint(equalToConstant: 60),
            joinGameButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            scheduleButton.topAnchor.constraint(equalTo: joinGameButton.bottomAnchor, constant: 10),
            scheduleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            scheduleButton.widthAnchor.constraint(equalToConstant: 60),
            scheduleButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            logOutButton.topAnchor.constraint(equalTo: scheduleButton.bottomAnchor, constant: 10),
            logOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            logOutButton.widthAnchor.constraint(equalToConstant: 60),
            logOutButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            editProfileButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            editProfileButton.widthAnchor.constraint(equalToConstant: 60),
            editProfileButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}


