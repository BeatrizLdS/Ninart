//
//  Extensions.swift
//  ninart_app
//
//  Created by Luciana Adrião on 23/02/23.
//

import Foundation
import UIKit

// MARK: Colors
extension UIColor {
    static let backgroundColor = UIColor(named: "BackgroundColor")
    static let textColor = UIColor(named: "TextColor")
}

extension UIImage {
    static let playButtonSize = UIImage.SymbolConfiguration(pointSize: 60)
    static let sideButtonSize = UIImage.SymbolConfiguration(pointSize: 32)
}

extension String {
    static func shortenTimeFormatter(timeInterval: Double) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(timeInterval))
    }
    static func minuteAndSecondFormatter(timeInterval: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .spellOut
        return formatter.string(from: TimeInterval(timeInterval))!
    }
}
