//
//  CommunityPopupViewController.swift
//  spotted
//
//  Created by Karen Sabile on 12/2/22.
//

import UIKit

class CommunityPopupViewController: UIViewController {
    
    let centeredView = UIView()
    let headerLabel = UILabel()
    let leafImageView1 = UIImageView()
    let leafImageView2 = UIImageView()
    let leafImageView3 = UIImageView()
    let ladybugImageView = UIImageView()
    let dormLabel = UILabel()
    let yearLabel = UILabel()
    let clubLabel = UILabel()
    let courseLabel = UILabel()
    let dismissLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTheView()
    }

    private func createTheView() {
        
        let xCoord = self.view.bounds.width / 2 - 150
        let yCoord = self.view.bounds.height / 2 - 300
        
        centeredView.layer.cornerRadius = 15
        centeredView.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        centeredView.layer.borderWidth = 7
        centeredView.backgroundColor = UIColor(red: 0.80, green: 0.93, blue: 0.95, alpha: 1.0)
        centeredView.frame = CGRect(x: xCoord, y: yCoord, width: 300, height: 500)
        self.view.addSubview(centeredView)
        
        headerLabel.text = "- Target Community -"
        headerLabel.font = UIFont(name: "Calibri", size: 25)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        leafImageView1.image = UIImage(named: "leaf-1")
        leafImageView1.contentMode = .scaleAspectFit
        leafImageView1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leafImageView1)
        
        leafImageView2.image = UIImage(named: "leaf-2")
        leafImageView2.contentMode = .scaleAspectFit
        leafImageView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leafImageView2)
        
        leafImageView3.image = UIImage(named: "leaf-3")
        leafImageView3.contentMode = .scaleAspectFit
        leafImageView3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leafImageView3)
        
        ladybugImageView.image = UIImage(named: "ladybug")
        ladybugImageView.contentMode = .scaleAspectFit
        ladybugImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ladybugImageView)
        
        dormLabel.text = "RBG"
        dormLabel.font = UIFont(name: "Calibri", size: 20)
        dormLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dormLabel)
        
        yearLabel.text = "2026"
        yearLabel.font = UIFont(name: "Calibri", size: 22.5)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLabel)
        
        clubLabel.text = "AppDev"
        clubLabel.font = UIFont(name: "Calibri", size: 15)
        clubLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clubLabel)
        
        courseLabel.text = "CS1998"
        courseLabel.font = UIFont(name: "Calibri", size: 15)
        courseLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(courseLabel)
        
        dismissLabel.text = "swipe down to dismiss"
        dismissLabel.font = UIFont(name: "Calibri", size: 15)
        dismissLabel.textAlignment = .center
        dismissLabel.layer.cornerRadius = 15
        dismissLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dismissLabel)
        
        setupConstraints()
    }
        
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: centeredView.safeAreaLayoutGuide.topAnchor, constant: 15),
            headerLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            leafImageView1.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor),
            leafImageView1.centerYAnchor.constraint(equalTo: centeredView.centerYAnchor),
            leafImageView1.widthAnchor.constraint(equalTo: centeredView.widthAnchor, multiplier: 0.5)
        ])
        NSLayoutConstraint.activate([
            leafImageView2.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor),
            leafImageView2.centerYAnchor.constraint(equalTo: centeredView.centerYAnchor, constant: -100),
            leafImageView2.widthAnchor.constraint(equalTo: centeredView.widthAnchor, multiplier: 0.5)
        ])
        NSLayoutConstraint.activate([
            leafImageView3.leadingAnchor.constraint(equalTo: centeredView.centerXAnchor),
            leafImageView3.centerYAnchor.constraint(equalTo: centeredView.centerYAnchor, constant: 125),
            leafImageView3.widthAnchor.constraint(equalTo: centeredView.widthAnchor, multiplier: 0.5)
        ])
        NSLayoutConstraint.activate([
            ladybugImageView.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor),
            ladybugImageView.centerYAnchor.constraint(equalTo: centeredView.centerYAnchor),
            ladybugImageView.widthAnchor.constraint(equalTo: centeredView.widthAnchor, multiplier: 0.75)
        ])
        NSLayoutConstraint.activate([
            dormLabel.topAnchor.constraint(equalTo: centeredView.centerYAnchor, constant: -30),
            dormLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 65)
        ])
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: centeredView.centerYAnchor, constant: 42.5),
            yearLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 77.5)
        ])
        NSLayoutConstraint.activate([
            clubLabel.topAnchor.constraint(equalTo: centeredView.centerYAnchor, constant: -12.5),
            clubLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -67.5)
        ])
        NSLayoutConstraint.activate([
            courseLabel.topAnchor.constraint(equalTo: centeredView.centerYAnchor, constant: 65),
            courseLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: -77.5)
        ])
        NSLayoutConstraint.activate([
            dismissLabel.topAnchor.constraint(equalTo: centeredView.bottomAnchor, constant: -25),
            dismissLabel.centerXAnchor.constraint(equalTo: centeredView.centerXAnchor)
        ])
    }
}
