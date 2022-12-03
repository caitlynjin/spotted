//
//  CameraViewController.swift
//  spotted
//
//  Created by Caitlyn Jin on 11/26/22.
//
//  Copyright (c) 2016, Andrew Walz.
//

import UIKit
import AVFoundation
import SwiftyCam

class CameraViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate, UploadPhotoDelegate {
    
    var captureButton = SpotButton()
    var flipCameraButton: UIButton!
    var flashButton = UIButton()
    
    weak var delegate: SendPhotoDelegate?
    
    override func viewDidLoad() {
        // MARK: You can edit the buttons for the view controller here
        
        super.viewDidLoad()
        view.contentMode = .scaleToFill
        
        captureButton.translatesAutoresizingMaskIntoConstraints = false
        captureButton.layer.cornerRadius = 35
        captureButton.clipsToBounds = true
        captureButton.layer.borderWidth = 5
        
        captureButton.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3)
        captureButton.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(captureButton)
        
        flashButton.translatesAutoresizingMaskIntoConstraints = false
        flashButton.setImage(#imageLiteral(resourceName: "flashOutline"), for: UIControl.State())
        flashButton.addTarget(self, action: #selector(toggleFlashTapped), for: .touchUpInside)
        view.addSubview(flashButton)
        
        setupConstraints()
        
        shouldPrompToAppSettings = true
        cameraDelegate = self
        shouldUseDeviceOrientation = false
        allowAutoRotate = false
        audioEnabled = false
        flashMode = .off
        captureButton.buttonEnabled = false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureButton.delegate = self
    }
    
    func setupConstraints() {
        // MARK: Edit the constraints here
        
        NSLayoutConstraint.activate([
            captureButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            captureButton.heightAnchor.constraint(equalToConstant: 70),
            captureButton.widthAnchor.constraint(equalTo: captureButton.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            flashButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            flashButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            flashButton.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    func postPhoto(image: UIImage) {
        delegate?.sendPhoto(image: image)
    }
    
    func swiftyCamSessionDidStartRunning(_ swiftyCam: SwiftyCamViewController) {
        print("Session did start running")
        captureButton.buttonEnabled = true
    }
    
    func swiftyCamSessionDidStopRunning(_ swiftyCam: SwiftyCamViewController) {
        print("Session did stop running")
        captureButton.buttonEnabled = false
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        let newVC = PhotoViewController(image: photo, delegate: self)
        self.present(newVC, animated: true, completion: nil)
    }


    func swiftyCamDidFailToConfigure(_ swiftyCam: SwiftyCamViewController) {
        let message = NSLocalizedString("Unable to capture media", comment: "Alert message when something goes wrong during capture session configuration")
        let alertController = UIAlertController(title: "AVCam", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Alert OK button"), style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didChangeZoomLevel zoom: CGFloat) {
        print("Zoom level did change. Level: \(zoom)")
        print(zoom)
    }

    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didSwitchCameras camera: SwiftyCamViewController.CameraSelection) {
        print("Camera did change to \(camera.rawValue)")
        print(camera)
    }

    @IBAction func cameraSwitchTapped(_ sender: Any) {
        switchCamera()
    }
    
    @objc func toggleFlashTapped(_ sender: Any) {
        toggleFlashAnimation()
    }
}


// UI Animations
extension CameraViewController {
    
    fileprivate func hideButtons() {
        UIView.animate(withDuration: 0.25) {
            self.flashButton.alpha = 0.0
            self.flipCameraButton.alpha = 0.0
        }
    }
    
    fileprivate func showButtons() {
        UIView.animate(withDuration: 0.25) {
            self.flashButton.alpha = 1.0
            self.flipCameraButton.alpha = 1.0
        }
    }
    
     func toggleFlashAnimation() {
        if flashMode == .auto{
            flashMode = .on
            flashButton.setImage(UIImage(named: "flash"), for: .normal)
        }else if flashMode == .on{
            flashMode = .off
            flashButton.setImage(UIImage(named: "flashOutline"), for: .normal)
        }else if flashMode == .off{
            flashMode = .auto
            flashButton.setImage(UIImage(named: "flashauto"), for: .normal)
        }
    }
}

protocol SendPhotoDelegate: UIViewController {
    func sendPhoto(image: UIImage)
}
