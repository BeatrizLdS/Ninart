//
//  StoryPageViewController.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 28/02/23.
//

import UIKit
import CoreData
import CoreHaptics

class StoryViewController: UIViewController {

    var storyPage: StoryPage?
    var viewModel: StoryPageViewModel = StoryPageViewModel()
    var count: Int8 = 1
    var currentIndexTopText = 0
    var totalText: Int8 = 0
    var lastPageIndex: Int8 = 0
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)

    override func loadView() {
        title = viewModel.title
        super.loadView()
        self.storyPage = StoryPage()
        self.view = self.storyPage

        totalText = viewModel.numberOfPages
        lastPageIndex = totalText - 1
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        showTwoText()
        setImageSeparator()

        storyPage?.numberOfBooks.text = "\(count)"
        storyPage?.horizontalStack.accessibilityValue = String.localizedStringWithFormat(
                    NSLocalizedString("page %d", comment: ""),
                    count)
        storyPage?.horizontalStack.incrementAndDecrementProtocol = self
        storyPage?.leftButtonHistory.isEnabled = false

        storyPage?.rightButtonHistory.addTarget(self,
                                                action: #selector(incrementLabel),
                                                for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self,
                                               action: #selector(decrementLabel),
                                               for: .touchUpInside)
        storyPage?.rightButtonHistory.addTarget(self,
                                                action: #selector(updateTextAndImage),
                                                for: .touchUpInside)
        storyPage?.leftButtonHistory.addTarget(self,
                                               action: #selector(downTextAndImage),
                                               for: .touchUpInside)

        selectionFeedbackGenerator.prepare()
        impactFeedbackGenerator.prepare()
    }

    func showTwoText() {
        let uniqueTexts = viewModel.pageTexts ?? []
        let countText = uniqueTexts.count

        if countText > 0 {
            let topTextIndex = Int8(currentIndexTopText % countText)
            let text = viewModel.pageTexts![Int(topTextIndex)]

            // Mapear todos os indices onde tem .
            // pegar o indice do meio do array (ordenado)
            // fazer split

            let dotIndexes = text.enumerated().compactMap { tuple in
                let (item, element) = tuple
                let index = text.index(text.startIndex, offsetBy: item)
                if item > 0, item < text.count - 1 {
                    if element == ".",
                       text[text.index(after: index)] != ".",
                       text[text.index(before: index)] != "." {
                        return item
                    }
                } else if item == text.count - 1 {
                    if element == ".",
                       text[text.index(before: index)] != "." {
                        return item
                    }
                } else if item == 0 {
                    if element == ".",
                       text[text.index(after: index)] != "." {
                        return item
                    }
                }
                return nil
            }

            if dotIndexes.count > 1 {
                let splitIndex = dotIndexes[Int(exactly: (dotIndexes.count/2)-1)!]
                let halfIndex = text.index(text.startIndex, offsetBy: splitIndex)

                let upText = text[text.startIndex...halfIndex]
                var downText = text[text.index(after: halfIndex)...text.index(before: text.endIndex)]

                if downText.first == " " { _ = downText.popFirst() }

                storyPage?.upTextBooks.text = "\(upText)"
                storyPage?.downTextBooks.text = "\(downText)"

            } else {
                storyPage?.upTextBooks.text = ""
                storyPage?.downTextBooks.text = text
            }

//            let textLength = text.count
//            let halfTextLength = textLength / 2
//            let startIndex = text.index(text.startIndex, offsetBy: 0)
//            let endIndex = text.index(text.startIndex, offsetBy: halfTextLength)
//            let firstHalf = String(text[startIndex..<endIndex])
//            let secondHalf = String(text[endIndex..<text.endIndex])
//
//            storyPage?.upTextBooks.text = firstHalf
//            storyPage?.downTextBooks.text = secondHalf
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

    @objc func updateTextAndImage() {

        if currentIndexTopText + 2 >= viewModel.pageTexts!.count {
            storyPage?.rightButtonHistory.isEnabled = false
        }

        currentIndexTopText += 1
        showTwoText()
        setImageSeparator()
        selectionFeedbackGenerator.selectionChanged()
        impactFeedbackGenerator.impactOccurred()
        AudioManager.shared.prepareToPlay(audioName: "pageturn", audioType: "mp3")
        AudioManager.shared.player?.play()

        if storyPage?.leftButtonHistory.isEnabled == false {
            storyPage?.leftButtonHistory.isEnabled = true
        }
    }

    @objc func downTextAndImage() {
        if currentIndexTopText >= 1 {
            currentIndexTopText -= 1
            showTwoText()
            setImageSeparator()
            selectionFeedbackGenerator.selectionChanged()
            impactFeedbackGenerator.impactOccurred()
            AudioManager.shared.prepareToPlay(audioName: "pageturn", audioType: "mp3")
            AudioManager.shared.player?.play()
        }

        if storyPage?.rightButtonHistory.isEnabled == false {
            storyPage?.rightButtonHistory.isEnabled = true
        }
    }

    @objc func incrementLabel() {
        count += 1
        storyPage!.numberOfBooks.text = "\(count)"
        storyPage?.horizontalStack.accessibilityValue = String.localizedStringWithFormat(
                    NSLocalizedString("page %d", comment: ""),
                    count)
    }

    @objc func decrementLabel() {
        if count > 1 {
            count -= 1
            storyPage!.numberOfBooks.text = "\(count)"
            storyPage?.horizontalStack.accessibilityValue = String.localizedStringWithFormat(
                        NSLocalizedString("page %d", comment: ""),
                        count)
        }

        if count == 1 {
            storyPage?.leftButtonHistory.isEnabled = false
        }
    }
}

extension StoryViewController: IncrementAndDecrementProtocol {
    func increment() {
        if count != viewModel.numberOfPages {
            updateTextAndImage()
            incrementLabel()
        }
    }

    func decrement() {
        if count != 1 {
            downTextAndImage()
            decrementLabel()
        }
    }

}
