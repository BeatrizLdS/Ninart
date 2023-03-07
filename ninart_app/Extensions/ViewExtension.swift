//
//  ViewExtension.swift
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
}
