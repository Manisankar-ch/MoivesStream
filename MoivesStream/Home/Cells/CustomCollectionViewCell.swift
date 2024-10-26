//
//  CustomCollectionViewCell.swift
//  MoivesStream
//
//  Created by Mani Sankar on 26/10/24.
//


import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabelText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabelText)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            titleLabelText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabelText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabelText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: VideoModel) {
        titleLabelText.text = model.title
        loadImage(from: model.thumbnailUrl)
    }
    
    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        MoviesStreamHelper.loadImage(url: url, imageView: self.imageView)
    }
}
