//
//  GradientView.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit

class GradientView: UIView {
    let gradient = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        gradient.colors = [UIColor.Primary.cgColor, UIColor.Tertiary.cgColor]
        layer.addSublayer(gradient)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        gradient.frame = bounds
    }
}

extension UIColor {
    static let Primary = UIColor(
        red: 22/255,
        green: 32/255,
        blue: 89/255,
        alpha: 1)
    static let Secondary = UIColor(
        red: 46/255,
        green: 70/255,
        blue: 140/255,
        alpha: 1)
    static let Tertiary = UIColor(
        red: 64/255,
        green: 103/255,
        blue: 153/255,
        alpha: 1)
    static let AccentText = UIColor(
        red: 242/255,
        green: 238/255,
        blue: 155/255,
        alpha: 1)
    static let Accent = UIColor(
        red: 242/255,
        green: 211/255,
        blue: 53/255,
        alpha: 1)
}
