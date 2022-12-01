//
//  ViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit
import AVFoundation

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    var captureSession = AVCaptureSession()
    var stillImageOutput = AVCapturePhotoOutput()
    var videoPreviewLayer = AVCaptureVideoPreviewLayer()
    var previewView = UIView()
    
    var leaderboard = LeaderboardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemRed
        UITabBar.appearance().backgroundColor = UIColor(red: 0.64, green: 0.75, blue: 0.31, alpha: 1.0)
        self.tabBarController?.delegate = self
        
        viewControllers = [
            createNavController(for: CommunityViewController(), image: UIImage(named: "community-toolbar")!),
            createNavController(for: FeedViewController(), image: UIImage(named: "feed-toolbar")!),
            createNavController(for: CameraViewController(), image: UIImage(named: "camera-toolbar")!),
            createNavController(for: leaderboard, image: UIImage(named: "leaderboard-toolbar")!),
            createNavController(for: ProfileViewController(), image: UIImage(named: "profile-toolbar")!)]
        
        self.selectedViewController = viewControllers![2]
    }
    
    // source: medium.com
    fileprivate func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.image = image
          rootViewController.navigationItem.title = title
          return navController
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
