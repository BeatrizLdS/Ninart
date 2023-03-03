//
//  StoryPageViewModel.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 28/02/23.
//

import Foundation

class StoryPageViewModel {

    
    var dataModel: Story?

    func loadData() {
        if let data = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let jsonData = try! Data(contentsOf: data)
                dataModel = try JSONDecoder().decode(Story.self, from: jsonData)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }

    var title: String? {
        return dataModel?.title
    }

    var imageStory: String? {
        return dataModel?.image ?? nil
    }

    var numberOfPages: Int8 {
        return Int8(dataModel?.pages.count ?? 0)
    }

    var pageImages: [String]? {
        guard let pageImage = dataModel?.pages else { return nil }
        return pageImage.map({ $0.image })
    }

    var pageTexts: [String]? {
        guard let pageText = dataModel?.pages else { return nil }
        return pageText.map({ $0.text }) 
    }

//    var pageData: [(image: String, text: String)]? {
//        guard let pages = dataModel?.pages else { return nil }
//        return pages.map({ ($0.image, $0.text) })
//    }
}
