//
//  AudiobookView.swift
//  ninart_app
//
//  Created by Luciana Adrião on 23/02/23.
//

import UIKit

class AudiobookView: UIView {

    let verticalStack: UIStackView = {
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

    let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let pausePlayButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = UIColor.textColor
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 80)
        configuration.image = UIImage(systemName: "play.circle.fill",
                                      withConfiguration: sizeConfig)
        configuration.contentInsets = .zero
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let playBackwardButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFill
        configuration.baseForegroundColor = UIColor.textColor
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 36)
        configuration.image = UIImage(systemName: "gobackward.10",
                                      withConfiguration: sizeConfig)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let playForwardButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.plain()
        button.contentMode = .scaleAspectFill
        configuration.baseForegroundColor = UIColor.textColor
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 36)
        configuration.image = UIImage(systemName: "goforward.10",
                                      withConfiguration: sizeConfig)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // TODO: Adicionar uma terceira stack para o slider e as labels
    let sliderControl: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0

        // Chama a função somente quando o slider parar em uma posição
        slider.isContinuous = false
        slider.backgroundColor = .backgroundColor
        slider.tintColor = UIColor.textColor
        slider.thumbTintColor = UIColor(red: 106/255, green: 90/255, blue: 101/255, alpha: 1)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        label.textColor = .textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        label.textColor = .textColor
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
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(bookCover)
        verticalStack.addArrangedSubview(audioControls)

        audioControls.addSubview(horizontalStack)
        audioControls.addSubview(sliderControl)
        audioControls.addSubview(currentTimeLabel)
        audioControls.addSubview(durationLabel)

        horizontalStack.addArrangedSubview(playBackwardButton)
        horizontalStack.addArrangedSubview(pausePlayButton)
        horizontalStack.addArrangedSubview(playForwardButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            bookCover.heightAnchor.constraint(equalTo: self.verticalStack.heightAnchor, multiplier: 0.5),
            bookCover.widthAnchor.constraint(equalTo: self.verticalStack.widthAnchor, multiplier: 0.65),

            audioControls.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            audioControls.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            horizontalStack.topAnchor.constraint(equalTo: self.audioControls.topAnchor,  constant: 24),
            horizontalStack.heightAnchor.constraint(equalTo: self.audioControls.heightAnchor, multiplier: 0.4),
            horizontalStack.widthAnchor.constraint(lessThanOrEqualTo: self.audioControls.widthAnchor, multiplier: 0.8),
            horizontalStack.centerXAnchor.constraint(equalTo: self.audioControls.centerXAnchor),

            pausePlayButton.heightAnchor.constraint(equalTo: self.horizontalStack.heightAnchor),
            pausePlayButton.widthAnchor.constraint(equalTo: self.pausePlayButton.heightAnchor),

            sliderControl.heightAnchor.constraint(equalTo: self.audioControls.heightAnchor, multiplier: 0.4),
            sliderControl.bottomAnchor.constraint(equalTo: self.audioControls.safeAreaLayoutGuide.bottomAnchor),
            sliderControl.widthAnchor.constraint(equalTo: self.audioControls.widthAnchor, multiplier: 0.67),
            sliderControl.leadingAnchor.constraint(equalTo: self.audioControls.leadingAnchor, constant: 18),

            currentTimeLabel.leadingAnchor.constraint(equalTo: sliderControl.trailingAnchor, constant: 12),
            currentTimeLabel.centerYAnchor.constraint(equalTo: sliderControl.centerYAnchor),

            durationLabel.leadingAnchor.constraint(equalTo: currentTimeLabel.trailingAnchor, constant: 4),
            durationLabel.centerYAnchor.constraint(equalTo: currentTimeLabel.centerYAnchor)

        ])
    }
}
