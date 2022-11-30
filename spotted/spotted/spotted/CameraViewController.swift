//
//  CameraViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/26/22.
//

import UIKit
import SwiftyCam

class CameraViewController: UIViewController {
    
    var button = UIButton()
    
    weak var delegate: UpdateScoreDelegate?

    init(delegate: UpdateScoreDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        button.setTitle("Increment", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(addToScore), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        setupConstraints()
    }
    
    @objc func addToScore() {
        delegate?.increment()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

protocol UpdateScoreDelegate: UIViewController {
    func increment()
}
