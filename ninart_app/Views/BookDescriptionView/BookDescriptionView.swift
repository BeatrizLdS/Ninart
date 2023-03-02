//
//  BookDescription.swift
//  ninart_app
//
//  Created by Luciana Adrião on 01/03/23.
//

import UIKit

class BookDescriptionView: UIView {
    // MARK: Properties
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
        stack.alignment = .top
        stack.backgroundColor = .clear
        stack.distribution = .equalCentering
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let readStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.backgroundColor = .clear
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let playStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let readButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFit
        configuration.baseForegroundColor = UIColor.textColor
        configuration.image = UIImage(systemName: "book.circle.fill", withConfiguration: UIImage.playButtonSize)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let readLabel: UILabel = {
        let label = UILabel()
        label.text = "Read"
        label.textColor = .textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let playButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFit
        configuration.baseForegroundColor = UIColor.textColor
        configuration.image = UIImage(systemName: "speaker.wave.2.circle.fill", withConfiguration: UIImage.playButtonSize)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let playLabel: UILabel = {
        let label = UILabel()
        label.text = "Play"
        label.textColor = .textColor

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        buttonsHStack.addArrangedSubview(readStack)
        buttonsHStack.addArrangedSubview(playStack)

        readStack.addArrangedSubview(readButton)
        readStack.addArrangedSubview(readLabel)

        playStack.addArrangedSubview(playButton)
        playStack.addArrangedSubview(playLabel)

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            bookCover.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            bookCover.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            bookCover.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            bookCover.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),

            buttonsHStack.topAnchor.constraint(lessThanOrEqualTo: bookCover.bottomAnchor, constant: 24),
            buttonsHStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonsHStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6, constant: 48),
            buttonsHStack.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
