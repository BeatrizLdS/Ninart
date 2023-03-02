//
//  StatusView.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 02/03/23.
//

import UIKit

class StatusView: UIView {

    let statusLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.isAccessibilityElement = false
        return label
    }()

    func setText(_ string: String) {
        statusLabel.text = string
    }

    func setFont(_ font: UIFont) {
        statusLabel.font = font
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension StatusView: SettingViews {
    func setupSubviews() {
        self.addSubview(statusLabel)
    }

    func setupConstraints() {
        let statusLabelConstraints = [
            statusLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                             constant: 5),
            statusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                constant: -5),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: 5),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: -5)
        ]
        NSLayoutConstraint.activate(statusLabelConstraints)
    }
}
