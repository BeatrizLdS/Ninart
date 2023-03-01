//
//  BookDescription.swift
//  ninart_app
//
//  Created by Luciana Adrião on 01/03/23.
//

import UIKit

class BookDescriptionView: UIView {
    let bookCover: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aSundayAfternoonOnTheIslandOfLaGrandeJatte")
        imageView.tintColor = .textColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityLabel = "Image of a lake"
        imageView.isAccessibilityElement = true
        return imageView
    }()
    let buttonsHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let readButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFill
        configuration.baseForegroundColor = UIColor.textColor
        configuration.image = UIImage(systemName: "book.circle.fill",
                                      withConfiguration: UIImage.playButtonSize)
        button.configuration = configuration
//        button.setTitle("Read", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let playButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFill
        configuration.baseForegroundColor = UIColor.textColor
        configuration.image = UIImage(systemName: "play.circle.fill",
                                      withConfiguration: UIImage.playButtonSize)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        buildLayoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension BookDescriptionView: SettingViews {
    func setupSubviews() {
        addSubview(bookCover)
        addSubview(buttonsHStack)
        buttonsHStack.addArrangedSubview(readButton)
        buttonsHStack.addArrangedSubview(playButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            bookCover.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            bookCover.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            bookCover.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            bookCover.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),

            buttonsHStack.topAnchor.constraint(equalTo: bookCover.bottomAnchor, constant: 48),
            buttonsHStack.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        ])
    }
}
