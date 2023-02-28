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
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    let bookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.70))
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.setImage(UIImage(systemName: "book.fill"), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(1.25, 1.25, 1.25)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.tintColor = .white
        button.isAccessibilityElement = true
        button.accessibilityTraits = .button
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

    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.2
        label.font = UIFontMetrics(
            forTextStyle: .body).scaledFont(
                for: .systemFont(
                    ofSize: 14,
                    weight: .medium
                )
            )
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.isAccessibilityElement = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = 10
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    private func addSubviews() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(bookButton)
        contentView.addSubview(statusLabel)
        contentView.addSubview(progressBar)
    }

    private func setConstraints() {
        let bookButtonConstraints = [
            bookButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bookButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5),
            bookButton.widthAnchor.constraint(equalToConstant: 50),
            bookButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        let progressBarConstrainsts = [
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            progressBar.widthAnchor.constraint(equalToConstant: contentView.bounds.width)
        ]
        let statusLabelConstraints = [
            statusLabel.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -5),
            statusLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(bookButtonConstraints)
        NSLayoutConstraint.activate(progressBarConstrainsts)
        NSLayoutConstraint.activate(statusLabelConstraints)
    }

    func configure(image: String, bookTitle: String, totalPages: Int, currentPage: Int) {
        // General configuration
        posterImageView.image = UIImage(named: image)
        progressBar.setProgress(2/6, animated: false)
        //        bookButton.addTarget(, action: , for: ) // local de inserir ação do botão

        // Accessibility
        bookButton.accessibilityLabel = String.localizedStringWithFormat(
            NSLocalizedString(
                "keep reading %@! page %d",
                comment: ""),
            bookTitle,
            currentPage
        )
        statusLabel.text = String.localizedStringWithFormat(
            NSLocalizedString(
                "page %d",
                comment: ""),
            currentPage
        )
        progressBar.accessibilityLabel = String.localizedStringWithFormat(
            NSLocalizedString(
                "you read %d pages of %d",
                comment: ""),
            currentPage,
            totalPages
        )
        progressBar.accessibilityValue = ""
    }
}
