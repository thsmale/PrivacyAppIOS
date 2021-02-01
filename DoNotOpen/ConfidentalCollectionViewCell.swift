//
//  ConfidentalCollectionViewCell.swift
//  DoNotOpen
//
//  Created by Tommy Smale on 11/22/20.
//

import UIKit

class ConfidentalCollectionViewCell: UICollectionViewCell {
    static var identifier: String = "ConfidentalCell"
    
    //weak var textLabel: UILabel!
    weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /*
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
        self.textLabel = textLabel
        self.reset()
         */
        
        let daniellaSelfie = UIImage(named: "daniellaSelfie")
        let imageView = UIImageView(image: daniellaSelfie)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
        self.imageView = imageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func reset() {
        //self.textLabel.textAlignment = .center
        self.imageView.contentMode = .scaleAspectFit
        //estimate size
        
    }
}
