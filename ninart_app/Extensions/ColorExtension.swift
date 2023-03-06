//
//  ColorExtension.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 24/02/23.
//

import Foundation
import UIKit

extension UIColor {

    static let progressTint = UIColor(named: "progressTint")
    static let progressTrack = UIColor(named: "progressTrack")

    static let background: UIColor? = {
        let color = UIColor(named: "BackgroundColor")
        return color
    }()

    static let text: UIColor? = {
        let color = UIColor(named: "TextColor")
        return color
    }()

    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let textColor = UIColor(named: "TextColor")
}
