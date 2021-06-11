//
//  NewReleaseCollectionViewCell.swift
//  Spotify
//
//  Created by  Ivan Kamenev on 10.06.2021.
//

import UIKit

class NewReleaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "NewReleaseCollectionViewCell"
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: NewReleasesCellViewModel) {
        
    }
}
