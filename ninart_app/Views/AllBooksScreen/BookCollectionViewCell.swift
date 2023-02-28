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
        imageView.contentMode = .scaleAspectFill
        
//        imageView.intrinsicContentSize = CGSize(width: 130, height: 180)
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

    func configure(story: Story) {
        posterImageView.image = UIImage(named: story.image)
        isAccessibilityElement = true
        accessibilityLabel = story.title
        accessibilityTraits = .button
    }

//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let targetSize = CGSize(width: 130, height: 180)
//        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(
//            targetSize,
//            withHorizontalFittingPriority: .required,
//            verticalFittingPriority: .fittingSizeLevel)
//        return layoutAttributes
//    }
}
