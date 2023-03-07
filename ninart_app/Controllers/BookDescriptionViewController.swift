//
//  BookDescriptionViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 01/03/23.
//

import UIKit

class BookDescriptionViewController: UIViewController {
    let bookDescriptionView = BookDescriptionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = bookDescriptionView

        navigationItem.title = "Exceptional Doom"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonTitle = ""
        bookDescriptionView.buttonsDelegate = self
    }
}

extension BookDescriptionViewController: CircleButtonProtocol {
    func readAction() {
        let newViewController = StoryViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    func playAction() {
        let newViewController = AudiobookViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
