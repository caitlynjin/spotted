//
//  ViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit
import AVFoundation

class TabBarController: UITabBarController, UITabBarControllerDelegate, UpdateScoreDelegate {

    var captureSession = AVCaptureSession()
    var stillImageOutput = AVCapturePhotoOutput()
    var videoPreviewLayer = AVCaptureVideoPreviewLayer()
    var previewView = UIView()
    
    var leaderboard = LeaderboardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
//        captureSession.sessionPreset = .medium
//        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
//            else {
//                print("Unable to access back camera!")
//                return
//        }
//        do {
//            let input = try AVCaptureDeviceInput(device: backCamera)
//
//            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
//                captureSession.addInput(input)
//                captureSession.addOutput(stillImageOutput)
//                setupLivePreview()
//            }
//        }
//        catch let error {
//            print("Error Unable to initialize back camera: \(error.localizedDescription)")
//        }
        
        self.tabBarController?.delegate = self
        
        viewControllers = [
            createNavController(for: FeedViewController(), title: "Feed", image: UIImage(named: "bear")!),
            createNavController(for: CommunityViewController(), title: "Community", image: UIImage(named: "bear")!),
            createNavController(for: CameraViewController(delegate: self), title: "Camera", image: UIImage(named: "bear")!),
            createNavController(for: ProfileViewController(), title: "Profile", image: UIImage(named: "bear")!),
            createNavController(for: leaderboard, title: "Leaderboard", image: UIImage(named: "bear")!)]
        
        self.selectedViewController = viewControllers![2]
    }
    
    // source: medium.com
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }
    
     func increment() {
         leaderboard.score += 1
     }

//    func setupLivePreview() {
//        videoPreviewLayer.session = captureSession
//
//        videoPreviewLayer.videoGravity = .resizeAspect
//        videoPreviewLayer.connection?.videoOrientation = .portrait
//        previewView.layer.addSublayer(videoPreviewLayer)
//
//        DispatchQueue.global(qos: .userInitiated).async {
//            self.captureSession.startRunning()
//            self.videoPreviewLayer.frame = self.previewView.bounds
//        }
//    }
}

protocol ChangeTextDelegate: UIViewController {
    func update()
}
