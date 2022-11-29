//
//  GalleryCollectionViewCell.swift
//  spotted
//
//  Created by Karen Sabile on 11/27/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    var nameLabel = UILabel()
    var targetImageView = UIImageView()
    var captionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemRed
        contentView.layer.cornerRadius = 5.0
        contentView.clipsToBounds = false
        
        nameLabel.font = .systemFont(ofSize: 30)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        targetImageView.contentMode = .scaleAspectFit
        targetImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(targetImageView)
        
        captionLabel.font = .systemFont(ofSize: 20)
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(captionLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            targetImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            targetImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            targetImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            targetImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: targetImageView.bottomAnchor, constant: 20),
            captionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            captionLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            captionLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func configure(post: Post) {
        nameLabel.text = post.name
        targetImageView.image = UIImage(named: post.imageName)
        captionLabel.text = post.caption
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
