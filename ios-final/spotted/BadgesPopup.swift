//
//  BadgesPopup.swift
//  spotted
//
//  Created by Antoinette Marie Torres on 12/2/22.
//

import UIKit

class BadgesPopupViewController: UIViewController {
    
    let centeredView = UIView()
    let shelfImageView = UIImageView()
    let badgesLabel = UILabel()
    let dismissLabel = UILabel()
    
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
        centeredView.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)
        centeredView.frame = CGRect(x: xCoord, y: yCoord, width: 300, height: 300)
        self.view.addSubview(centeredView)
        
        shelfImageView.image = UIImage(named: "badges-shelf")
        shelfImageView.layer.cornerRadius = 15
        shelfImageView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        shelfImageView.layer.borderWidth = 7
        shelfImageView.clipsToBounds = true
        shelfImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shelfImageView)
        
        badgesLabel.text = "Badges"
        badgesLabel.textAlignment = .center
        badgesLabel.textColor = .black
        badgesLabel.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        badgesLabel.layer.cornerRadius = 15
        badgesLabel.layer.masksToBounds = true
        badgesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(badgesLabel)
        
        dismissLabel.text = "swipe down to dismiss"
        dismissLabel.textColor = .white
        dismissLabel.font = UIFont(name: "Calibri", size: 15)
        dismissLabel.textAlignment = .center
        dismissLabel.layer.cornerRadius = 15
        dismissLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dismissLabel)
        
        setUpConstraints()
        
        }
        
    func setUpConstraints() {

//        //targetLabel
        NSLayoutConstraint.activate([
            shelfImageView.topAnchor.constraint(equalTo: centeredView.safeAreaLayoutGuide.topAnchor),
            shelfImageView.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor),
            shelfImageView.bottomAnchor.constraint(equalTo: centeredView.safeAreaLayoutGuide.bottomAnchor),
            shelfImageView.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor),
            shelfImageView.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            badgesLabel.topAnchor.constraint(equalTo: centeredView.safeAreaLayoutGuide.topAnchor, constant: 20),
            badgesLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor),
            badgesLabel.widthAnchor.constraint(equalToConstant: 100),
            badgesLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        NSLayoutConstraint.activate([
            dismissLabel.topAnchor.constraint(equalTo: centeredView.bottomAnchor, constant: -25),
            dismissLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
        ])
    }
}
