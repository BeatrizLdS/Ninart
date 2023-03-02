//
//  Extension.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 27/02/23.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }

    func buttonHistory(imgName: String, accesibility: String) -> UIButton {
        let button = UIButton()
        button.contentMode = .scaleAspectFit
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.backgroundColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
        button.setImage(UIImage(named: imgName), for: .normal)

//        var config = UIButton.Configuration.plain()
//        let size = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium, scale: .medium)
//
//        config.baseForegroundColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
//        config.image = UIImage(systemName: "plus", withConfiguration: size)
//        button.configuration = config
        button.accessibilityLabel = accesibility

        button.accessibilityHint = "Toque no butão"
        button.accessibilityTraits = .button
        button.isAccessibilityElement = true
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }
}

//let button = UIButton(type: .custom)
//        button.setImage(UIImage(named: imgName), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
