//
//  GoogleSignInViewController.swift
//  spotted
//
//  Created by Karen Sabile on 12/1/22.
//

import UIKit
import GoogleSignIn
import Firebase

class GoogleSignInViewController: UIViewController {
    
    let signInButton = GIDSignInButton()
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .systemRed
        
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.style = .wide
        view.addSubview(signInButton)
        
        backgroundImageView.image = UIImage(named: "title-screen-background")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        setupConstraints()
    }
    
    @objc func signIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let signInConfig = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            if let error = error {
                print(error.localizedDescription)
            }
            // TODO: make POST request to backend
            //  user?.profile.
            self.navigationController?.pushViewController(TabBarController(), animated: true)
//            if let userToken = user?.authentication.idToken {
//                NetworkManager.sendToken(token: userToken) { User in
//                    print(User)
//                }
        }
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 25),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 100),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
