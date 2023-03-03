//
//  StoryPageViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit
import CoreData

class StoryViewController: UIViewController {

//    let storyPage = StoryPage()
    var storyPage: StoryPage?
    let viewModel: StoryPageViewModel = StoryPageViewModel()
    var count: Int8 = 1
    var currentIndexTopText = 0
    var currentIndexBottomText = 1

    override func loadView() {

        super.loadView()
        self.storyPage = StoryPage()
        self.view = self.storyPage
        storyPage?.titleScreen.text = viewModel.title
//        view = storyPage


    }

    override func viewDidLoad() {

        super.viewDidLoad()
        viewModel.loadData()
        showTwoText()

        storyPage?.rightButtonHistory.addTarget(self, action: #selector(incrementLabel), for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self, action: #selector(decrementLabel), for: .touchUpInside)

        storyPage?.rightButtonHistory.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    func showTwoText() {

//        let uniqueTexts = Set(viewModel.pageTexts ?? []).sorted()
        let uniqueTexts = Set(viewModel.pageTexts ?? [])
        let countText = uniqueTexts.count

        if countText >= 2 {

            let topTextIndex = currentIndexTopText % countText
            let bottomTextIndex = currentIndexBottomText % countText

            storyPage?.upTextBooks.text = viewModel.pageTexts![topTextIndex]
            storyPage?.upTextBooks.text = viewModel.pageTexts![bottomTextIndex]

//            let averageIndex = countText / 2
//            storyPage!.upTextBooks.text = uniqueTexts.prefix(upTo: averageIndex).joined(separator: "\n")
//            storyPage!.downTextBooks.text = uniqueTexts.suffix(from: averageIndex).joined(separator: "\n")

        } else if countText == 1 {
            storyPage!.upTextBooks.text = uniqueTexts.first
        } else {
            print("ERROU")
        }
    }

    @objc func nextButtonTapped() {
        currentIndexTopText += 2
        currentIndexBottomText += 2
        showTwoText()
    }

    @objc func backButtonTapped() {
        currentIndexTopText -= 2
        currentIndexBottomText -= 2
        showTwoText()
    }

    @objc func incrementLabel() {
        count += 1
        storyPage!.numberOfBooks.text = "\(count)"
    }

    @objc func decrementLabel() {

        if count > 1 {
            count -= 1
            storyPage!.numberOfBooks.text = "\(count)"
        }
    }
}
