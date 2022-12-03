//
//  PhotoViewController.swift
//  spotted
//
//  Created by Caitlyn Jin on 11/30/22.
//

import UIKit

class PhotoViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var backgroundImage: UIImage
    
    weak var delegate: UploadPhotoDelegate?

    init(image: UIImage, delegate: UploadPhotoDelegate) {
        self.backgroundImage = image
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        let backgroundImageView = UIImageView(frame: view.frame.offsetBy(dx: 0, dy: -40))
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.image = backgroundImage
        view.addSubview(backgroundImageView)
        
        let cancelButton = UIButton(frame: CGRect(x: 10.0, y: 10.0, width: 20.0, height: 20.0))
        cancelButton.setImage(#imageLiteral(resourceName: "cancel"), for: UIControl.State())
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
        
        let uploadButton = UIButton(frame: CGRect(x: self.view.frame.size.width-115.0, y: self.view.frame.size.height-115.0, width: 100.0, height: 50.0))
        uploadButton.contentMode = .scaleAspectFit
        uploadButton.setImage(#imageLiteral(resourceName: "upload-photo"), for: UIControl.State())
        uploadButton.addTarget(self, action: #selector(uploadViewController), for: .touchUpInside)
        view.addSubview(uploadButton)
    }

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func uploadViewController() {
        present(UploadViewController(), animated: true, completion: nil)
        
    }
}

extension PhotoViewController: SendPhotoDelegate {
    func sendPhoto(image: UIImage) {
        delegate?.postPhoto(image: image)
    }
}

protocol UploadPhotoDelegate: UIViewController {
    func postPhoto(image: UIImage)
}
