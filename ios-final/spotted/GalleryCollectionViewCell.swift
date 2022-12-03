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
    var commentsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 0.76, green: 0.14, blue: 0.18, alpha: 1.0)

        contentView.layer.cornerRadius = 5.0
        contentView.clipsToBounds = false
        
        nameLabel.font = UIFont(name: "Valken", size: 20)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        targetImageView.contentMode = .scaleAspectFit
        targetImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(targetImageView)
        
        captionLabel.font = UIFont(name: "Calibri", size: 17.5)
        captionLabel.textColor = .white
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(captionLabel)
        
        commentsLabel.text = "- comments -"
        commentsLabel.font = UIFont(name: "Calibri", size: 15)
        commentsLabel.textColor = .white
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(commentsLabel)
        
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
            targetImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            targetImageView.heightAnchor.constraint(equalTo: targetImageView.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: targetImageView.bottomAnchor, constant: 20),
            captionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            captionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            captionLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        NSLayoutConstraint.activate([
            commentsLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor),
            commentsLabel.leadingAnchor.constraint(equalTo: captionLabel.leadingAnchor),
            commentsLabel.widthAnchor.constraint(equalTo: captionLabel.widthAnchor),
            commentsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(post: Post) {
        nameLabel.text = post.title
        targetImageView.image = UIImage(named: "placeholder")
        captionLabel.text = post.contents
        for comment in post.comments {
            commentsLabel.text! += comment.contents
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
