//
//  AudiobookViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 23/02/23.
//

import UIKit

class AudiobookViewController: UIViewController {

    let audiobookView = AudiobookView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = audiobookView
        navigationItem.title = "Exceptional Doom"
        navigationItem.largeTitleDisplayMode = .never
    }

}
