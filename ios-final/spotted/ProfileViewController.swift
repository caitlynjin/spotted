//
//  ProfileViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let titleLabel = UILabel()
    let profileImageView = UIImageView()
    let profileNameLabel = UILabel()
    let progressImageView = UIImageView()
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
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)

        titleLabel.text = "Profile"
        titleLabel.font = UIFont(name: "Valken", size: 35)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        profileImageView.image = UIImage(named: "profile-pic")
        profileImageView.layer.cornerRadius = 75
        profileImageView.layer.borderWidth = 6
        profileImageView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        profileNameLabel.text = "Jennifer"
        profileNameLabel.font = UIFont(name: "Calibri-Bold", size: 35)
        profileNameLabel.textAlignment = .center
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileNameLabel)
        
        progressImageView.image = UIImage(named: "progress-tracker")
        progressImageView.clipsToBounds = true
        progressImageView.layer.cornerRadius = 15
        progressImageView.layer.borderWidth = 4
        progressImageView.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        progressImageView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        progressImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressImageView)
        
        galleryButton.setImage(UIImage(named: "gallery-button"), for: .normal)
        galleryButton.layer.borderWidth = 4
        galleryButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        galleryButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        galleryButton.layer.cornerRadius = 15
        galleryButton.clipsToBounds = true
        galleryButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(galleryButton)
        
        badgesButton.setImage(UIImage(named: "badges-button"), for: .normal)
        badgesButton.layer.borderWidth = 4
        badgesButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        badgesButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        badgesButton.layer.cornerRadius = 15
        badgesButton.clipsToBounds = true
        badgesButton.addTarget(self, action: #selector(showBadge), for: .touchUpInside)
        badgesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(badgesButton)
        
        targetButton.setImage(UIImage(named: "target-button"), for: .normal)
        targetButton.layer.borderWidth = 4
        targetButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        targetButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        targetButton.layer.cornerRadius = 15
        targetButton.clipsToBounds = true
        targetButton.addTarget(self, action: #selector(showTarget), for: .touchUpInside)
        targetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(targetButton)
        
        communityButton.setImage(UIImage(named: "community-button"), for: .normal)
        communityButton.layer.borderWidth = 4
        communityButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        communityButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        communityButton.layer.cornerRadius = 15
        communityButton.clipsToBounds = true
        communityButton.addTarget(self, action: #selector(showCommunity), for: .touchUpInside)
        communityButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(communityButton)
        
        joinGameButton.setImage(UIImage(named: "join-game-button"), for: .normal)
        joinGameButton.layer.borderWidth = 4
        joinGameButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        joinGameButton.addTarget(self, action: #selector(joinGame), for: .touchUpInside)
        joinGameButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        joinGameButton.layer.cornerRadius = 30
        joinGameButton.clipsToBounds = true
        joinGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(joinGameButton)
        
        scheduleButton.setImage(UIImage(named: "schedule-button"), for: .normal)
        scheduleButton.layer.borderWidth = 4
        scheduleButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        scheduleButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scheduleButton.layer.cornerRadius = 30
        scheduleButton.clipsToBounds = true
        scheduleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scheduleButton)
        
        logOutButton.setImage(UIImage(named: "log-out-button"), for: .normal)
        logOutButton.layer.borderWidth = 4
        logOutButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        logOutButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        logOutButton.layer.cornerRadius = 30
        logOutButton.clipsToBounds = true
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logOutButton)
        
        editProfileButton.setImage(UIImage(named: "edit-profile-button"), for: .normal)
        editProfileButton.layer.borderWidth = 4
        editProfileButton.backgroundColor = UIColor(red: 1.0, green: 0.64, blue: 0.11, alpha: 1.0)
        editProfileButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        editProfileButton.layer.cornerRadius = 30
        editProfileButton.clipsToBounds = true
        editProfileButton.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)
        
        setupConstraints()
    }
    
    @objc func editProfile() {
        navigationController?.pushViewController(EditProfileViewController(delegate: self), animated: true)
    }
    
    @objc func showTarget() {
        let vc = TargetPopupViewController()
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(TargetPopupViewController(), animated: true, completion: nil)
    }
    
    @objc func joinGame() {
        self.navigationController?.pushViewController(joinGameViewController(), animated: true)
    }
    
    @objc func showBadge() {
        let vc = BadgesPopupViewController()
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        self.present(BadgesPopupViewController(), animated: true, completion: nil)
    }
    
    @objc func showCommunity() {
        self.present(CommunityPopupViewController(), animated: true, completion: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
            progressImageView.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 30),
            progressImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            progressImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            galleryButton.topAnchor.constraint(equalTo: progressImageView.bottomAnchor, constant: 15),
            galleryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            galleryButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            galleryButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
        ])
        
        //new target should have badges position
        NSLayoutConstraint.activate([
            targetButton.topAnchor.constraint(equalTo: progressImageView.bottomAnchor, constant: 15),
            targetButton.leadingAnchor.constraint(equalTo: galleryButton.trailingAnchor, constant: 10),
            targetButton.widthAnchor.constraint(equalTo: galleryButton.widthAnchor, multiplier: 0.45),
            targetButton.heightAnchor.constraint(equalTo: galleryButton.heightAnchor, multiplier: 0.45)
                ])
        
        //new community should have target position
        NSLayoutConstraint.activate([
            communityButton.topAnchor.constraint(equalTo: progressImageView.bottomAnchor, constant: 15),
            communityButton.leadingAnchor.constraint(equalTo: badgesButton.trailingAnchor, constant: 10),
            communityButton.widthAnchor.constraint(equalTo: badgesButton.widthAnchor),
            communityButton.heightAnchor.constraint(equalTo: badgesButton.heightAnchor)
        ])
        
        //new badges is old community
        NSLayoutConstraint.activate([
            badgesButton.topAnchor.constraint(equalTo: targetButton.bottomAnchor, constant: 10),
            badgesButton.leadingAnchor.constraint(equalTo: galleryButton.trailingAnchor, constant: 10),
            badgesButton.widthAnchor.constraint(equalTo: galleryButton.widthAnchor, multiplier: 0.45),
            badgesButton.heightAnchor.constraint(equalTo: galleryButton.heightAnchor, multiplier: 0.45)
        ])
        
        NSLayoutConstraint.activate([
            joinGameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
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
            editProfileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            editProfileButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            editProfileButton.widthAnchor.constraint(equalToConstant: 60),
            editProfileButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension ProfileViewController: UpdateProfileDelegate {
    @objc func update(input: String) {
        profileNameLabel.text = input
    }
    
    func changeImage(_ picker: UIImagePickerController, picture: UIImage) {
        profileImageView.image = picture
        self.dismiss(animated: true, completion: nil)
    }
}

