//
//  EditProfileViewController.swift
//  spotted
//
//  Created by Karen Sabile on 12/2/22.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var titleLabel = UILabel()
    var imageButton = UIButton()
    var nameHeaderLabel = UILabel()
    var nameTextField = UITextField()
    var saveButton = UIButton()
    
    weak var imageView: UIImageView!
    weak var delegate: UpdateProfileDelegate?
    
    init(delegate: UpdateProfileDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
                
        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)
        
        titleLabel.text = "Edit Profile"
        titleLabel.font = UIFont(name: "Valken", size: 25)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        imageButton.setImage(UIImage(named: "profile-pic"), for: .normal)
        imageButton.addTarget(self, action: #selector(openPhotoLibrary), for: .touchUpInside)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageButton)
        
        nameHeaderLabel.text = "ENTER NAME"
        nameHeaderLabel.textColor = .white
        nameHeaderLabel.font = UIFont(name: "Calibri", size: 15)
        nameHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameHeaderLabel)
        
        nameTextField.textColor = .black
        nameTextField.font = .systemFont(ofSize: 15)
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.addTarget(self, action: #selector(updateProfile), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        setupConstraints()
    }
    
    // source: turbofuture.com
    @objc func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // source: zerotoappstore.com
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let picture = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            imageButton.setImage(picture, for: .normal)
            self.dismiss(animated: true, completion: nil)
        }
    
    // updates profile info
    @objc func updateProfile() {
        if let input = nameTextField.text {
            if input != "" {
                delegate?.update(input: input)
                delegate?.changeImage(UIImagePickerController(), picture: (imageButton.image(for: .normal)!))
            }
            else {
                let errorMessage = UIAlertController(title: "Error", message: "Please ensure that the name data field is completed", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: .none)        // sources: apple developer documentation,
                errorMessage.addAction(action)                                                         // stack overflow
                self.present(errorMessage, animated: true) {
                    
                }
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            imageButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            imageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageButton.widthAnchor.constraint(equalToConstant: 100),
            imageButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            nameHeaderLabel.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 25),
            nameHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameHeaderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameHeaderLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameHeaderLabel.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: nameHeaderLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameHeaderLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 20),
            saveButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

protocol UpdateProfileDelegate: UIViewController {
    func update(input: String)
    func changeImage(_ picker: UIImagePickerController, picture: UIImage)
}
