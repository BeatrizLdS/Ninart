//
//  StackExtension.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 07/03/23.
//

import Foundation
import UIKit

class StackWithDecrementAndIncrement: UIStackView {
    var incrementAndDecrementProtocol: IncrementAndDecrementProtocol?
    open override func accessibilityDecrement() {
        incrementAndDecrementProtocol?.decrement()
    }
    open override func accessibilityIncrement() {
        incrementAndDecrementProtocol?.increment()
    }
}
