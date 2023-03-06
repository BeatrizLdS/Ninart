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
    }

    override func viewDidLayoutSubviews() {
        setupUI()
    }
    func setupUI() {
        bookDescriptionView.playButton.addTarget(self, action: #selector(changeViews), for: .touchUpInside)
    }

    @objc func changeViews(_ sender: AnyObject) {
        print("play")
        let newViewController = AudiobookViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
