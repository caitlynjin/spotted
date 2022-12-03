//
//  FeedViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    var titleLabel = UILabel()
    var galleryCollectionView: UICollectionView!
    let spacing: CGFloat = 12
    let postReuseIdentifier: String = "postReuseIdentifier"
    
    let refreshControl = UIRefreshControl()

    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)
        
        titleLabel.text = "Feed"
        titleLabel.font = UIFont(name: "Valken", size: 30)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let postLayout = UICollectionViewFlowLayout()
        postLayout.minimumLineSpacing = spacing
        postLayout.minimumInteritemSpacing = spacing
        postLayout.scrollDirection = .vertical
        
        galleryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: postLayout)
        galleryCollectionView.backgroundColor = UIColor(red: 0.11, green: 0.57, blue: 1.0, alpha: 1.0)
        galleryCollectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: postReuseIdentifier)
        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(galleryCollectionView)
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            galleryCollectionView.refreshControl = refreshControl
        } else {
            galleryCollectionView.addSubview(refreshControl)
        }
        
        refreshData()
        
        setupConstraints()
    }
    
    @objc func refreshData() {
        NetworkManager.getAllPosts { postList in
            self.posts = postList.posts
            self.galleryCollectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
        NetworkManager.getUserProfile(id: 4) { user in
            
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            galleryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            galleryCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postReuseIdentifier, for: indexPath) as? GalleryCollectionViewCell {
            cell.configure(post: posts[indexPath.row])
            return cell
        }
        return GalleryCollectionViewCell()
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width
        return CGSize(width: size, height: size)
    }
}

extension FeedViewController: CreatePostDelegate {

    func createPost(id: Int, title: String, contents: String) {

        NetworkManager.createPost(id: id, title: title, contents: contents) { post in
            self.posts = [post] + self.posts
            self.galleryCollectionView.reloadData()

        }
    }

}
