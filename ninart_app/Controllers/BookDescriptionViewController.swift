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

        navigationItem.title = viewModel?.getStory()?.title ?? viewModel?.getAudioBook()?.title
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.backButtonTitle = ""
        bookDescriptionView.buttonsDelegate = self
        bookDescriptionView.configureImage(imageName: viewModel?.getStory()?.image,
                                           imageDescription: viewModel?.getImageDescription())
    }
}

extension BookDescriptionViewController: CircleButtonProtocol {
    func readAction() {
        let newViewModel = StoryPageViewModel()
        newViewModel.loadData(storyTitle: (viewModel?.getStory()!.title)!)
        let newViewController = StoryViewController()
        newViewController.viewModel = newViewModel
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    func playAction() {
        let newViewController = AudiobookViewController()
        let newViewModel = AudioBookViewModel(audioBook: viewModel?.getAudioBook())
        newViewController.viewModel = newViewModel
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
