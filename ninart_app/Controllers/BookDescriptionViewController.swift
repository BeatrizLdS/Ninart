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
        bookDescriptionView.bookCover.image = UIImage(
            named: viewModel?.getStory()?.image ?? "aSundayAfternoonOnTheIslandOfLaGrandeJatte")
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
        newViewController.audioName = (viewModel?.getAudioBook()!.audioName)!
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
