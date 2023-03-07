//
//  BookDescription.swift
//  ninart_app
//
//  Created by Luciana Adrião on 01/03/23.
//

import UIKit

class BookDescriptionView: UIView {

    var buttonsDelegate: CircleButtonProtocol?

    // MARK: Properties
    let bookCover: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Pinocchio")
        imageView.tintColor = .textColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
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

    let readButton: CircleButtonView = {
        let button = CircleButtonView()
        button.imageView.image = UIImage(systemName: "book.fill",
                                         withConfiguration: UIImage.bookAndSpeakerButtonSize)
        button.imageView.tintColor = .backgroundColor
        button.label.text = String(localized: "read")
        button.accessibilityLabel = String(localized: "read")
        button.label.textColor = .backgroundColor
        button.label.font = .preferredFont(forTextStyle: .body)
        button.label.adjustsFontForContentSizeCategory = true
        button.setBackgroundColor(.textColor!)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()

    var playButton: CircleButtonView = {
        let button = CircleButtonView()
        button.imageView.image = UIImage(systemName: "speaker.wave.2.fill",
                                         withConfiguration: UIImage.bookAndSpeakerButtonSize)
        button.imageView.tintColor = .backgroundColor
        button.label.text = String(localized: "play")
        button.accessibilityLabel = String(localized: "play")
        button.label.textColor = .backgroundColor
        button.label.font = .preferredFont(forTextStyle: .body)
        button.label.adjustsFontForContentSizeCategory = true
        button.setBackgroundColor(.textColor!)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        buildLayoutView()
        configTapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configTapGesture() {
        let readGesture = UITapGestureRecognizer(target: self, action: #selector(self.readButtonWasSelected))
        readButton.addGestureRecognizer(readGesture)
        let playGesture = UITapGestureRecognizer(target: self, action: #selector(self.playButtonWasSelected))
        playButton.addGestureRecognizer(playGesture)
    }
    @objc func readButtonWasSelected() {
        let haptics = UINotificationFeedbackGenerator()
        haptics.notificationOccurred(.success)
        buttonsDelegate?.readAction()
    }
    @objc func playButtonWasSelected() {
        let haptics = UINotificationFeedbackGenerator()
        haptics.notificationOccurred(.success)
        buttonsDelegate?.playAction()
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
            bookCover.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            bookCover.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            bookCover.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),

            buttonsHStack.topAnchor.constraint(lessThanOrEqualTo: bookCover.bottomAnchor, constant: 30),
            buttonsHStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonsHStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6, constant: 48),
            buttonsHStack.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
        self.layoutIfNeeded()
    }
}
