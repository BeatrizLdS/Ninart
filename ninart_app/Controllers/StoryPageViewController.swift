//
//  StoryPageViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit
import CoreData

class StoryViewController: UIViewController {

    var storyPage: StoryPage?
    let viewModel: StoryPageViewModel = StoryPageViewModel()
    var count: Int8 = 1
    var currentIndexTopText = 0
    var currentIndexBottomText = 1
    var totalText: Int8 = 0
    var lastPageIndex: Int8 = 0

    override func loadView() {

        super.loadView()
        self.storyPage = StoryPage()
        self.view = self.storyPage

        totalText = viewModel.numberOfPages
        lastPageIndex = totalText - 1
//        storyPage?.titleScreen.text = viewModel.title

    }

    override func viewDidLoad() {

        super.viewDidLoad()
        viewModel.loadData()
        showTwoText()
        setImageHistory()

        storyPage?.rightButtonHistory.addTarget(self, action: #selector(incrementLabel), for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self, action: #selector(decrementLabel), for: .touchUpInside)

        storyPage?.rightButtonHistory.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }

    func showTwoText() {

        let uniqueTexts = Set(viewModel.pageTexts ?? [])
        let countText = uniqueTexts.count

        if countText >= 2 {

            let topTextIndex = Int8(currentIndexTopText % countText)
            let bottomTextIndex = Int8(currentIndexBottomText % countText)

            storyPage?.upTextBooks.text = viewModel.pageTexts![Int(topTextIndex)]
            storyPage?.downTextBooks.text = viewModel.pageTexts![Int(bottomTextIndex)]

        } else if countText == 1 {
            storyPage!.upTextBooks.text = uniqueTexts.first
        } else {
            print("ERROU")
        }
    }

    func setImageSeparator() {
        let topImageIndex = Int(currentIndexTopText % (viewModel.pageImages?.count ?? 1))
        if let image = viewModel.pageImages?[topImageIndex] {
            storyPage?.imageStory.image = UIImage(named: image)
        }
    }

    func setImageHistory() {
        storyPage?.imageStory.image = UIImage(named: viewModel.imageStory ?? "")
    }

    @objc func nextButtonTapped() {
        currentIndexTopText += 2
        currentIndexBottomText += 2
        showTwoText()
        setImageSeparator()

        if currentIndexTopText >= lastPageIndex && currentIndexBottomText >= lastPageIndex {
            // Desativar o botão
            storyPage?.rightButtonHistory.isEnabled = false
        } else {
            // Incrementar o índice e atualizar as páginas
            currentIndexTopText += 2
            currentIndexBottomText += 2
            showTwoText()
            setImageSeparator()
        }

    }

    @objc func backButtonTapped() {
        if currentIndexTopText > 0 && currentIndexBottomText > 0 {
            currentIndexTopText -= 2
            currentIndexBottomText -= 2
            showTwoText()
            setImageSeparator()

            if !storyPage!.rightButtonHistory.isEnabled {
                storyPage?.rightButtonHistory.isEnabled = true
            }
        }
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

//    @objc func nextButtonTapped() {
//        let uniqueTexts = Set(viewModel.pageTexts ?? [])
//        let countText = uniqueTexts.count
//        if currentIndexTopText + 2 < countText && currentIndexBottomText + 2 < countText {
//            currentIndexTopText += 2
//            currentIndexBottomText += 2
//            showTwoText()
//        }
//    }


//if let numberOfPages = viewModel.numberOfPages, currentIndexBottomText >= numberOfPages {
//    // Desativa o botão "rightButtonHistory" se o usuário estiver na última página
//    storyPage?.rightButtonHistory.isEnabled = false
//}
//
//if totalText != 0 && currentIndexBottomText >= totalText {
//    // Desativa o botão "rightButtonHistory" se o usuário estiver na última página
//    storyPage?.rightButtonHistory.isEnabled = false
//}
