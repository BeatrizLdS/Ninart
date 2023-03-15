//
//  SelectBookProtocol.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 28/02/23.
//

import Foundation
import UIKit

public protocol SelectBook {
    func didSelect<Book>(book: Book, selectedView: UIView)
}
