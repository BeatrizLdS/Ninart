//
//  ContinueBookCollectionViewCell.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 23/02/23.
//

import UIKit

class ContinueBookCollectionViewCell: UICollectionViewCell {

    static let identifier = "ContinueCollectionViewCell"

    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let bookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.imageView?.layer.transform = CATransform3DMakeScale(1.6, 1.6, 1.6)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.70))
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.tintColor = .white
        button.isAccessibilityElement = true
        button.accessibilityTraits = .button
        button.isUserInteractionEnabled =  false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .progressTrack
        progressView.progressTintColor = .progressTint
        progressView.layer.shadowColor = UIColor.black.cgColor
        progressView.layer.shadowOpacity = 1
        progressView.layer.shadowRadius = 14
        progressView.isAccessibilityElement = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    let statusView: StatusView = {
        let view = StatusView()
        view.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.50))
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.masksToBounds = true
        layer.cornerRadius = 10
        buildLayoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    func configureBook(book: Story) {
        bookButton.setImage(UIImage(systemName: "book.fill"), for: .normal)
        posterImageView.image = UIImage(named: book.image)
        progressBar.setProgress(2/6, animated: false) // mock
        statusView.setText( String.localizedStringWithFormat(
            NSLocalizedString("page %d",
                              comment: ""),
            2))
        bookButton.accessibilityLabel = String.localizedStringWithFormat(
            NSLocalizedString(
                "keep reading %@! page %d",
                comment: ""),
            book.title,
            2 // page mock
        )
        progressBar.accessibilityLabel = String.localizedStringWithFormat(
            NSLocalizedString(
                "you read %d pages of %d",
                comment: ""),
            2,
            book.pages.count
        )
        progressBar.accessibilityValue = ""
    }

    func configureAudioBook(audioBook: AudioBook) {
        bookButton.setImage(UIImage(systemName: "speaker.wave.2.fill"),for: .normal)
        posterImageView.image = UIImage(named: audioBook.image)
        progressBar.setProgress(2/6, animated: false)
        statusView.setText( String.shortenTimeFormatter(timeInterval: 144.14947845804988)!)
        let timeHeard = String.minuteAndSecondFormatter(timeInterval: 144.14947845804988)
        bookButton.accessibilityLabel = String.localizedStringWithFormat(
            NSLocalizedString(
                "keep listening %@! from %@!",
                comment: ""),
            audioBook.title,
            timeHeard // page mock
        )
        progressBar.accessibilityLabel = String.localizedStringWithFormat(
            NSLocalizedString(
                "did you hear %@! of %@!",
                comment: ""),
            timeHeard,
            timeHeard
        )
        progressBar.accessibilityValue = ""
    }

    @objc func buttonAction() {
        let haptics = UINotificationFeedbackGenerator()
        haptics.notificationOccurred(.success)
    }
}

extension ContinueBookCollectionViewCell: SettingViews {
    func setupSubviews() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(bookButton)
        contentView.addSubview(statusView)
        contentView.addSubview(progressBar)
    }
    func setupConstraints() {
        let bookButtonConstraints = [
            bookButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bookButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5),
            bookButton.widthAnchor.constraint(equalToConstant: 60),
            bookButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        let progressBarConstrainsts = [
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            progressBar.widthAnchor.constraint(equalToConstant: contentView.bounds.width)
        ]
        let statusViewConstraints = [
            statusView.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -2),
            statusView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(bookButtonConstraints)
        NSLayoutConstraint.activate(progressBarConstrainsts)
        NSLayoutConstraint.activate(statusViewConstraints)
    }
}
