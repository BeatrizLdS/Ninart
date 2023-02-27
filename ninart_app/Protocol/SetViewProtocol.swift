//
//  SetViewProtocol.swift
//  ninart_app
//
//  Created by Luciana Adrião on 23/02/23.
//

import Foundation

public protocol SettingViews {
    func setupSubviews()
    func setupConstraints()
}

extension SettingViews {
    func buildLayoutView() {
        setupSubviews()
        setupConstraints()
    }
}
