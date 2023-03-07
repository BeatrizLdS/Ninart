//
//  StoryPage.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit

class StoryPage: UIView {

    let titleScreen: UILabel = {
        let title = UILabel()

        title.translatesAutoresizingMaskIntoConstraints = false
        title.frame = CGRect(x: 0, y: 0, width: 69, height: 27)
        title.backgroundColor = .clear
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textAlignment = .center
        title.textColor = .textColor
        title.isAccessibilityElement = true
        title.adjustsFontForContentSizeCategory = true

        return title
    }()

    let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 20
        stack.backgroundColor = .backgroundColor
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.backgroundColor = .backgroundColor
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let history: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.layer.shadowRadius = 5
        scrollView.layer.shadowOpacity = 0.2
        scrollView.autoresizingMask = [.flexibleHeight]
        scrollView.isScrollEnabled = true
        scrollView.automaticallyAdjustsScrollIndicatorInsets = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let upTextBooks: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
//        text.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        text.backgroundColor = .clear

        text.textAlignment = .natural
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        text.textColor = .text
        text.isEditable = false
        text.isScrollEnabled = false
        text.isAccessibilityElement = true
        text.adjustsFontForContentSizeCategory = true

        return text
    }()

    let imageStory: UIImageView = {
        let image = UIImageView()

        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        image.bounds = image.frame
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.accessibilityLabel = "imagem do livro"
        image.accessibilityHint = "Toque na imagem"
        image.accessibilityTraits = .image
        image.isAccessibilityElement = true
        image.translatesAutoresizingMaskIntoConstraints = false

        return image

    }()

    let downTextBooks: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        text.backgroundColor = .clear
        text.textAlignment = .natural
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        text.textColor = .text
        text.isEditable = false
        text.isScrollEnabled = false
        text.isAccessibilityElement = true
        text.adjustsFontForContentSizeCategory = true

        return text
    }()

    let leftButtonHistory : UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        let size = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .medium)
        config.baseForegroundColor = .text
        config.image = UIImage(systemName: "arrow.left.circle.fill", withConfiguration: size)
        button.configuration = config
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .background
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.imageView?.layer.transform = CATransform3DMakeScale(2, 2, 2)
        button.accessibilityHint = "Toque no butão"
        button.accessibilityLabel = "Voltar Página"
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    let numberOfBooks: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 46, height: 29)
        label.textColor = .text
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)

        return label

    }()

    let rightButtonHistory : UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        let size = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .medium)
        config.baseForegroundColor = .text
        config.image = UIImage(systemName: "arrow.right.circle.fill", withConfiguration: size)
        button.configuration = config
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .background
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.imageView?.layer.transform = CATransform3DMakeScale(2, 2, 2)
        button.accessibilityHint = "Toque no butão"
        button.accessibilityLabel = "Próxima Página"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: Override

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        buildLayoutView()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension StoryPage: SettingViews {

    func setupSubviews() {

        addSubviews(titleScreen, horizontalStack, history)

        verticalStack.addArrangedSubview(upTextBooks)
        verticalStack.addArrangedSubview(imageStory)
        verticalStack.addArrangedSubview(downTextBooks)

        history.addSubview(verticalStack)

        horizontalStack.addArrangedSubview(leftButtonHistory)
        horizontalStack.addArrangedSubview(numberOfBooks)
        horizontalStack.addArrangedSubview(rightButtonHistory)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([

            titleScreen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleScreen.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            verticalStack.topAnchor.constraint(equalTo: self.history.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: self.history.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: self.history.trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: self.history.bottomAnchor),
            verticalStack.widthAnchor.constraint(equalTo: self.history.widthAnchor),

            history.topAnchor.constraint(equalTo: titleScreen.bottomAnchor),
            history.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            history.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            imageStory.heightAnchor.constraint(equalTo: imageStory.widthAnchor, multiplier: 0.7),

            horizontalStack.topAnchor.constraint(equalTo: self.history.bottomAnchor, constant: 10),
            horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            horizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            horizontalStack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
}
