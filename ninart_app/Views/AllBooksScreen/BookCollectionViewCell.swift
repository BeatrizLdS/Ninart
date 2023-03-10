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
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    func configure<RandomStory>(story: RandomStory) {
        isAccessibilityElement = true
        accessibilityTraits = .button
        if story is Story {
            let book = story as! Story
            posterImageView.image = UIImage(named: book.image)
            accessibilityLabel = book.title
        } else {
            let audioBook = story as! AudioBook
            posterImageView.image = UIImage(named: audioBook.image)
            accessibilityLabel = audioBook.title
        }
    }
}
