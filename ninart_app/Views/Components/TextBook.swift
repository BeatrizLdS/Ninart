//
//  TextBook.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 24/02/23.
//

import UIKit

class TextBook: UIView {

    let textBooks: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.frame = CGRect(x: 0, y: 0, width: 339, height: 152)
        text.backgroundColor = .clear

        text.textAlignment = .natural
        text.font = UIFont(name: "SFProText-Regular", size: 16)
        text.textColor = UIColor(red: 0.169, green: 0.176, blue: 0.259, alpha: 1.0)
        text.isEditable = false
        text.isAccessibilityElement = true
        text.adjustsFontForContentSizeCategory = true
        if #available(iOS 16.0, *) {
            text.isFindInteractionEnabled = true
        }

        return text
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func loadJSON(named jsonName: String) {
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let text = try JSONDecoder().decode(String.self, from: data)
                textBooks.text = text
            } catch {
                print(error)
            }
        }
    }

    func buildLayout(){
        self.addSubview(textBooks)

        NSLayoutConstraint.activate([
            textBooks.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            textBooks.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            textBooks.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            textBooks.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
