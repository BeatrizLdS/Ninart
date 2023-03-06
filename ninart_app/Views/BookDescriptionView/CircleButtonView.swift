//
//  CircleButtonView.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 03/03/23.
//

import UIKit

class CircleButtonView: UIView {

    var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "pencil.circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let label: UILabel = {
        let label = UILabel()
        label.text = "butão"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let button: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayoutView()
        isAccessibilityElement = true
        accessibilityTraits = .button
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setBackgroundColor(_ color: UIColor) {
        backgroundColor = color
        let biggerSize = getBiggerSize()
        self.layer.cornerRadius = 0.5 * biggerSize
    }
    private func getBiggerSize() -> CGFloat {
        button.layoutIfNeeded()
        let height = button.bounds.height
        let width = button.bounds.width
        if height > width {
            return height
        } else {
            return width
        }
    }
    override func layoutSubviews() {
        let biggerSize = getBiggerSize()
        self.layer.cornerRadius = 0.5 * biggerSize
    }
}

extension CircleButtonView: SettingViews {
    func setupSubviews() {
        self.addSubview(button)
        self.button.addArrangedSubview(imageView)
        self.button.addArrangedSubview(label)
    }
    func setupConstraints() {
        let buttonConstraints = [
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -2),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        let constraints = [
            self.heightAnchor.constraint(equalTo: button.heightAnchor,
                                                    constant: 12),
            self.widthAnchor.constraint(equalTo: button.heightAnchor,
                                        constant: 12)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
        NSLayoutConstraint.activate(constraints)
    }
}