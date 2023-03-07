//
//  BookDescriptionViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 01/03/23.
//

import UIKit

class BookDescriptionViewController: UIViewController {
    let bookDescriptionView = BookDescriptionView()
    var viewModel: BookDescriptionViewModel?

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
        print("Aq vai adicionar a navegação para página de leitura")
    }
    func playAction() {
        let newViewController = AudiobookViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
