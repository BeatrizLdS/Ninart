//
//  StoryPageViewController.swift
//  ninart_app
//
//  Created by Luciana Adrião on 16/06/22.
//

import UIKit
import CoreData

class StoryViewController: UIViewController {

    let storyPage = StoryPage()
    let viewModel: StoryPageViewModel = StoryPageViewModel()
    var value: Int8 = 1

    override func loadView() {
        super.loadView()
        view = storyPage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        showTwoText()
        showImageHistory()
        setImageSeparator()

    }

    func showTwoText() {

//        let uniqueTexts = Set(viewModel.pageTexts ?? []).sorted()
        let uniqueTexts = Set(viewModel.pageTexts!)
        let countText = uniqueTexts.count

        if countText >= 2 {
            let averageIndex = countText / 2
            storyPage.upTextBooks.text = viewModel.pageTexts![0]
            storyPage.downTextBooks.text = viewModel.pageTexts![1]
//            storyPage.upTextBooks.text = uniqueTexts.prefix(upTo: averageIndex).joined(separator: "\n")
//            storyPage.downTextBooks.text = uniqueTexts.suffix(from: averageIndex).joined(separator: "\n")

        } else if countText == 1 {
            storyPage.upTextBooks.text = uniqueTexts.first
        } else {
            print("Aqui")
        }
    }

    func setImageSeparator() {
        storyPage.imageStory.image = UIImage(named: viewModel.dataModel!.image)
    }

    func showImageHistory() {
        if let imageURLString = viewModel.dataModel?.image, let imageURL = URL(string: imageURLString) {
            DispatchQueue.global(qos: .userInitiated).async {
                do {
                    let imageData = try Data(contentsOf: imageURL)
                    DispatchQueue.main.async { [self] in
//                        storyPage.imageStory.image = UIImage(data: imageData)
                    }
                } catch {
                    print("Error loading image data: \(error)")
                }
            }
        }
    }
}
