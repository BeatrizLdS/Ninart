//
//  StoryPageViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit
import CoreData
import CoreHaptics

class StoryViewController: UIViewController {

    var storyPage: StoryPage?
    let viewModel: StoryPageViewModel = StoryPageViewModel()
    var count: Int8 = 1
    var currentIndexTopText = 0
    var currentIndexBottomText = 1
    var totalText: Int8 = 0
    var lastPageIndex: Int8 = 0
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)


    override func loadView() {

        super.loadView()
        self.storyPage = StoryPage()
        self.view = self.storyPage

        totalText = viewModel.numberOfPages
        lastPageIndex = totalText - 1
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        viewModel.loadData()
        showTwoText()
        setImageHistory()
        setImageSeparator()

        storyPage?.titleScreen.text = viewModel.title
        storyPage?.numberOfBooks.text = "\(count)"
        
        storyPage?.rightButtonHistory.addTarget(self, action: #selector(incrementLabel), for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self, action: #selector(decrementLabel), for: .touchUpInside)

        storyPage?.rightButtonHistory.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        selectionFeedbackGenerator.prepare()
        impactFeedbackGenerator.prepare()
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let value = Float(scrollView.contentOffset.x)/Float(scrollView.frame.size.width)
//        pageControl.currentPage = Int(floorf(value))
//    }
//    // MARK: - SettingHScroll
//    private func configureScrollView() {
//        view.addSubview(scrollView)
//        NSLayoutConstraint.activate([
//            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
//        ])
//    }
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

        // Gera feedback tátil de seleção
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.selectionChanged()

        // Gera feedback tátil de impacto
        let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackGenerator.impactOccurred()

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

        // Gera feedback tátil de seleção
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.selectionChanged()

        // Gera feedback tátil de impacto
        let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        impactFeedbackGenerator.impactOccurred()

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

//guard let pages = viewModel.story?.pages else { return }
//
//    let currentPageIndex = Int(currentIndexTopText / 2)
//
//    if currentPageIndex < pages.count {
//        let currentPage = pages[currentPageIndex]
//        storyPage?.upTextBooks.text = currentPage.text
//
//        let nextPageIndex = currentPageIndex + 1
//        if nextPageIndex < pages.count {
//            let nextPage = pages[nextPageIndex]
//            storyPage?.downTextBooks.text = nextPage.text
//        } else {
//            storyPage?.downTextBooks.text = ""
//        }
//
//        if let image = viewModel.pageImages?[currentPageIndex] {
//            storyPage?.imageStory.image = UIImage(named: image)
//        }
//    }
//
//    let isLastPage = currentPageIndex == pages.count - 1
//    storyPage?.rightButtonHistory.isEnabled = !isLastPage
