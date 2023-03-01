//
//  AudiobookView.swift
//  ninart_app
//
//  Created by Luciana Adrião on 23/02/23.
//

import UIKit

class AudiobookView: UIView {

    let mainViewVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 80
        stack.backgroundColor = .backgroundColor
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let bookCover: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aSundayAfternoonOnTheIslandOfLaGrandeJatte")
        imageView.tintColor = .textColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.accessibilityLabel = "Image of a lake"
        imageView.isAccessibilityElement = true
        return imageView
    }()

    let audioControls: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColor
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    let playBackwardButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFill
        configuration.baseForegroundColor = UIColor.textColor
        configuration.image = UIImage(systemName: "gobackward.10",
                                      withConfiguration: UIImage.sideButtonSize)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let pausePlayButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = UIColor.textColor
        configuration.image = UIImage(systemName: "play.circle.fill",
                                      withConfiguration: UIImage.playButtonSize)
//        configuration.contentInsets = .zero
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let playForwardButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFill
        configuration.baseForegroundColor = UIColor.textColor
        configuration.image = UIImage(systemName: "goforward.10",
                                      withConfiguration: UIImage.sideButtonSize)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // TODO: Adicionar uma terceira stack para o slider e as labels
    let playbackStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let timeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isAccessibilityElement = false
        return stack
    }()
    let sliderControl: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.isContinuous = false
        slider.backgroundColor = .backgroundColor
        slider.tintColor = UIColor.textColor
        slider.thumbTintColor = UIColor(red: 106/255, green: 90/255, blue: 101/255, alpha: 1)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.accessibilityTraits = .adjustable
        slider.accessibilityLabel = String(localized: "audio position")
        return slider
    }()
    let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        label.textColor = .textColor
        label.isAccessibilityElement = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        label.textColor = .textColor
        label.isAccessibilityElement = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.backgroundColor
        buildLayoutView()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AudiobookView: SettingViews {
    func setupSubviews() {
        addSubview(mainViewVStack)
        mainViewVStack.addArrangedSubview(bookCover)
        mainViewVStack.addArrangedSubview(audioControls)

        audioControls.addSubview(buttonsHStack)
        audioControls.addSubview(playbackStack)

        playbackStack.addArrangedSubview(sliderControl)
        playbackStack.addArrangedSubview(timeStack)

        timeStack.addArrangedSubview(currentTimeLabel)
        timeStack.addArrangedSubview(durationLabel)

        buttonsHStack.addArrangedSubview(playBackwardButton)
        buttonsHStack.addArrangedSubview(pausePlayButton)
        buttonsHStack.addArrangedSubview(playForwardButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainViewVStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainViewVStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainViewVStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainViewVStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            bookCover.heightAnchor.constraint(equalTo: self.mainViewVStack.heightAnchor, multiplier: 0.5),
            bookCover.widthAnchor.constraint(equalTo: self.mainViewVStack.widthAnchor, multiplier: 0.65),

            audioControls.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            audioControls.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            buttonsHStack.topAnchor.constraint(equalTo: self.audioControls.topAnchor,  constant: 12),
            buttonsHStack.heightAnchor.constraint(equalTo: self.audioControls.heightAnchor, multiplier: 0.4),
            buttonsHStack.centerXAnchor.constraint(equalTo: self.audioControls.centerXAnchor),
//            buttonsHStack.widthAnchor.constraint(equalTo: self.audioControls.widthAnchor),
//            buttonsHStack.widthAnchor.constraint(lessThanOrEqualTo:
//                                                    self.audioControls.widthAnchor, multiplier: 0.8),

            pausePlayButton.heightAnchor.constraint(equalTo: self.buttonsHStack.heightAnchor),
            pausePlayButton.widthAnchor.constraint(equalTo: self.pausePlayButton.heightAnchor),

            playBackwardButton.heightAnchor.constraint(equalTo: self.buttonsHStack.heightAnchor),
            playForwardButton.heightAnchor.constraint(equalTo: self.buttonsHStack.heightAnchor),

            playbackStack.topAnchor.constraint(equalTo: buttonsHStack.bottomAnchor, constant: 36),
            playbackStack.widthAnchor.constraint(lessThanOrEqualTo: self.audioControls.widthAnchor),
            playbackStack.centerXAnchor.constraint(equalTo: self.audioControls.centerXAnchor),
            playbackStack.bottomAnchor.constraint(equalTo:
                                                    self.audioControls.safeAreaLayoutGuide.bottomAnchor),

            sliderControl.widthAnchor.constraint(equalTo: self.audioControls.widthAnchor, multiplier: 0.9),
            sliderControl.topAnchor.constraint(equalTo: self.playbackStack.topAnchor),

            timeStack.widthAnchor.constraint(equalTo: self.sliderControl.widthAnchor),
            timeStack.topAnchor.constraint(equalTo: self.sliderControl.bottomAnchor)

        ])
    }
}
