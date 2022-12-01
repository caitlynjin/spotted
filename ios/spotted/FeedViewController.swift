//
//  FeedViewController.swift
//  spotted
//
//  Created by Karen Sabile on 11/22/22.
//

import UIKit

class FeedViewController: UIViewController {
    
    var gallery: UICollectionView!
    let spacing: CGFloat = 12
    let postReuseIdentifier: String = "postReuseIdentifier"
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        let post = Post(name: "ur mom", imageName: "bear", caption: "hahahahahahahah")
        posts = [post, post, post, post, post, post, post, post]
        
        let postLayout = UICollectionViewFlowLayout()
        postLayout.minimumLineSpacing = spacing
        postLayout.minimumInteritemSpacing = spacing
        postLayout.scrollDirection = .vertical
        
        gallery = UICollectionView(frame: .zero, collectionViewLayout: postLayout)
//        gallery.backgroundColor = .white
        gallery.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: postReuseIdentifier)
        gallery.dataSource = self
        gallery.delegate = self
        gallery.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gallery)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gallery.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            gallery.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            gallery.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            gallery.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
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
        let size = collectionView.frame.width - 25
        return CGSize(width: size, height: size)
    }
}
