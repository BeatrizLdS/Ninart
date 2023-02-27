//
//  TitlePage.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 26/02/23.
//

import UIKit

class TitlePage: UIView {

    let titleScreen: UILabel = {
        let title = UILabel()

        title.translatesAutoresizingMaskIntoConstraints = false
        title.frame = CGRect(x: 0, y: 0, width: 69, height: 27)
        title.backgroundColor = .clear

        title.textAlignment = .center
        title.textColor = .black
        title.isAccessibilityElement = true
        title.adjustsFontForContentSizeCategory = true

        return title
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setTypography(text: String, font: String, size: CGFloat) {
        titleScreen.text = text
        titleScreen.font = UIFont(name: font, size: size)
    }

    func buildLayout(){
        self.addSubview(titleScreen)

        NSLayoutConstraint.activate([
            titleScreen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            titleScreen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            titleScreen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleScreen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
