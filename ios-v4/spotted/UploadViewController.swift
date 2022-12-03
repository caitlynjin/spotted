//
//  UploadViewController.swift
//  spotted
//
//  Created by Caitlyn Jin on 12/2/22.
//

import UIKit

class UploadViewController: UIViewController {
    
    let targetImageView = UIImageView()
    let targetNameLabel = UILabel()
    let captionTextField = UITextField()
    let postButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)
        
        targetImageView.image = UIImage(named: "profile-pic")
        targetImageView.contentMode = .scaleAspectFit
        targetImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(targetImageView)
        
        targetNameLabel.text = "<target name>"
        targetNameLabel.font = UIFont(name: "Calibri-Bold", size: 30)
        targetNameLabel.textAlignment = .center
        targetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(targetNameLabel)
        
        captionTextField.text = "<progress tracker>"
        captionTextField.clipsToBounds = true
        captionTextField.font = UIFont(name: "Calibri-Bold", size: 15)
        captionTextField.layer.cornerRadius = 15
        captionTextField.layer.borderWidth = 4
        captionTextField.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        captionTextField.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        captionTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(captionTextField)
        
        postButton.setImage(UIImage(named: "gallery-button"), for: .normal)
        postButton.layer.borderWidth = 4
        postButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        postButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        postButton.layer.cornerRadius = 15
        postButton.clipsToBounds = true
        postButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
//        NSLayoutConstraint.activate([
//            profileTitleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            profileTitleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profileTitleImageView.heightAnchor.constraint(equalToConstant: 75),
//            profileTitleImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
//        ])
        
        NSLayoutConstraint.activate([
            targetImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            targetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            targetImageView.heightAnchor.constraint(equalToConstant: 150),
            targetImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            targetNameLabel.topAnchor.constraint(equalTo: targetImageView.bottomAnchor, constant: 10),
            targetNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            targetNameLabel.widthAnchor.constraint(equalToConstant: 200),
            targetNameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            captionTextField.topAnchor.constraint(equalTo: targetNameLabel.bottomAnchor, constant: 10),
            captionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            captionTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            captionTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: captionTextField.bottomAnchor, constant: 15),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            postButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            postButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
        ])
//
//        //new target should have badges position
//        NSLayoutConstraint.activate([
//            targetButton.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 15),
//            targetButton.leadingAnchor.constraint(equalTo: galleryButton.trailingAnchor, constant: 10),
//            targetButton.widthAnchor.constraint(equalTo: galleryButton.widthAnchor, multiplier: 0.45),
//            targetButton.heightAnchor.constraint(equalTo: galleryButton.heightAnchor, multiplier: 0.45)
//                ])
//
//        //new community should have target position
//        NSLayoutConstraint.activate([
//            communityButton.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 15),
//            communityButton.leadingAnchor.constraint(equalTo: badgesButton.trailingAnchor, constant: 10),
//            communityButton.widthAnchor.constraint(equalTo: badgesButton.widthAnchor),
//            communityButton.heightAnchor.constraint(equalTo: badgesButton.heightAnchor)
//        ])
//
//        //new badges is old community
//        NSLayoutConstraint.activate([
//            badgesButton.topAnchor.constraint(equalTo: targetButton.bottomAnchor, constant: 10),
//            badgesButton.leadingAnchor.constraint(equalTo: galleryButton.trailingAnchor, constant: 10),
//            badgesButton.widthAnchor.constraint(equalTo: galleryButton.widthAnchor, multiplier: 0.45),
//            badgesButton.heightAnchor.constraint(equalTo: galleryButton.heightAnchor, multiplier: 0.45)
//        ])
//
//        NSLayoutConstraint.activate([
//            joinGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
//            joinGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
//            joinGameButton.widthAnchor.constraint(equalToConstant: 60),
//            joinGameButton.heightAnchor.constraint(equalToConstant: 60)
//        ])
//        NSLayoutConstraint.activate([
//            scheduleButton.topAnchor.constraint(equalTo: joinGameButton.bottomAnchor, constant: 10),
//            scheduleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
//            scheduleButton.widthAnchor.constraint(equalToConstant: 60),
//            scheduleButton.heightAnchor.constraint(equalToConstant: 60)
//        ])
//        NSLayoutConstraint.activate([
//            logOutButton.topAnchor.constraint(equalTo: scheduleButton.bottomAnchor, constant: 10),
//            logOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
//            logOutButton.widthAnchor.constraint(equalToConstant: 60),
//            logOutButton.heightAnchor.constraint(equalToConstant: 60)
//        ])
//        NSLayoutConstraint.activate([
//            editProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
//            editProfileButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
//            editProfileButton.widthAnchor.constraint(equalToConstant: 60),
//            editProfileButton.heightAnchor.constraint(equalToConstant: 60)
//        ])
    }
}


