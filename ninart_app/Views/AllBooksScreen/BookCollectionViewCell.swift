//
//  ContinueReadingCollectionViewCell.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 23/02/23.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {

    static let identifier = "BookCollectionViewCell"

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "aSundayAfternoonOnTheIslandOfLaGrandeJatte")
//        imageView.image?.isAccessibilityElement = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
}
