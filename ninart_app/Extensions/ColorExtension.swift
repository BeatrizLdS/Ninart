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

// MARK: Colors
extension UIColor {
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let textColor = UIColor(named: "TextColor")
}

extension UIImage {
    static let playButtonSize = UIImage.SymbolConfiguration(pointSize: 60)
    static let bookAndSpeakerButtonSize = UIImage.SymbolConfiguration(pointSize: 50)
    static let sideButtonSize = UIImage.SymbolConfiguration(pointSize: 32)
}
