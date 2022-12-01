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

class CameraViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate {
    
    var captureButton = SpotButton()
    var flipCameraButton: UIButton!
    var flashButton: UIButton!
    
    
    override func viewDidLoad() {
        // MARK: You can edit the buttons for the view controller here
        
        super.viewDidLoad()
        
        captureButton.translatesAutoresizingMaskIntoConstraints = false
//        captureButton.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        view.addSubview(captureButton)
        
        setupConstraints()
        
        shouldPrompToAppSettings = true
        cameraDelegate = self
//        maximumVideoDuration = 10.0
        shouldUseDeviceOrientation = true
        allowAutoRotate = false
        audioEnabled = false
        flashMode = .auto
//        flashButton.setImage(#imageLiteral(resourceName: "flashauto"), for: UIControl.State())
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
            captureButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            captureButton.heightAnchor.constraint(equalToConstant: 40)
        ])
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
        let newVC = PhotoViewController(image: photo)
        self.present(newVC, animated: true, completion: nil)
    }

//    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
//        print("Did Begin Recording")
//        captureButton.growButton()
//        hideButtons()
//    }

//    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
//        print("Did finish Recording")
//        captureButton.shrinkButton()
//        showButtons()
//    }

//    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
//        let newVC = VideoViewController(videoURL: url)
//        self.present(newVC, animated: true, completion: nil)
//    }

//    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFocusAtPoint point: CGPoint) {
//        print("Did focus at point: \(point)")
//        focusAnimationAt(point)
//    }
    
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
    
//    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFailToRecordVideo error: Error) {
//        print(error)
//    }

    @IBAction func cameraSwitchTapped(_ sender: Any) {
        switchCamera()
    }
    
    @IBAction func toggleFlashTapped(_ sender: Any) {
//        flashEnabled = !flashEnabled
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
    
//    fileprivate func focusAnimationAt(_ point: CGPoint) {
//        let focusView = UIImageView(image: #imageLiteral(resourceName: "focus"))
//        focusView.center = point
//        focusView.alpha = 0.0
//        view.addSubview(focusView)
//
//        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
//            focusView.alpha = 1.0
//            focusView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
//        }) { (success) in
//            UIView.animate(withDuration: 0.15, delay: 0.5, options: .curveEaseInOut, animations: {
//                focusView.alpha = 0.0
//                focusView.transform = CGAffineTransform(translationX: 0.6, y: 0.6)
//            }) { (success) in
//                focusView.removeFromSuperview()
//            }
//        }
//    }
    
    fileprivate func toggleFlashAnimation() {
//        flashEnabled = !flashEnabled
        if flashMode == .auto{
            flashMode = .on
            flashButton.setImage(#imageLiteral(resourceName: "flash"), for: UIControl.State())
        }else if flashMode == .on{
            flashMode = .off
            flashButton.setImage(#imageLiteral(resourceName: "flashOutline"), for: UIControl.State())
        }else if flashMode == .off{
            flashMode = .auto
            flashButton.setImage(#imageLiteral(resourceName: "flashauto"), for: UIControl.State())
        }
    }
}
