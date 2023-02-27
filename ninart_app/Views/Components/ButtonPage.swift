//
//  ButtonPage.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 26/02/23.
//

import UIKit

class ButtonPage: UIView {

    let buttonHistory: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.backgroundColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
//        var config = UIButton.Configuration.plain()
//        let size = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium, scale: .medium)
//
//        config.baseForegroundColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
//        config.image = UIImage(systemName: "plus", withConfiguration: size)
//        button.configuration = config
        button.accessibilityHint = "Toque no butão"
        button.accessibilityTraits = .button
        button.isAccessibilityElement = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setAccesibilityLabel(label: String) {
        buttonHistory.accessibilityLabel = label
    }

    func setImage(image: String) {
        buttonHistory.setImage(UIImage(named: image), for: .normal)
    }

    func buildLayout(){
        self.addSubview(buttonHistory)

        NSLayoutConstraint.activate([
            buttonHistory.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            buttonHistory.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            buttonHistory.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            buttonHistory.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
