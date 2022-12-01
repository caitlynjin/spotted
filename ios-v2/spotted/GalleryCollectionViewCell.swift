//
//  GalleryCollectionViewCell.swift
//  spotted
//
//  Created by Karen Sabile on 11/27/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    var targetImageView = UIImageView()
    var captionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemRed
        contentView.layer.cornerRadius = 5.0
        contentView.clipsToBounds = false
        
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
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
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        NSLayoutConstraint.activate([
            targetImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            targetImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            targetImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            targetImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: targetImageView.bottomAnchor, constant: 20),
            captionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            captionLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            captionLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    func configure(post: Post) {
        titleLabel.text = post.title
        targetImageView.image = UIImage(named: "placeholder")
        captionLabel.text = post.contents
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
