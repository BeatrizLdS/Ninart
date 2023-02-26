//
//  ColorExtension.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 24/02/23.
//

import Foundation
import UIKit

extension UIColor {
    static let progressTint: UIColor? = {
        let color = UIColor(named: "progressTint")
        return color
    }()

    static let progressTrack: UIColor? = {
        let color = UIColor(named: "progressTrack")
        return color
    }()

    static let background: UIColor? = {
        let color = UIColor(named: "BackgroundColor")
        return color
    }()

    static let text: UIColor? = {
        let color = UIColor(named: "TextColor")
        return color
    }()
}
