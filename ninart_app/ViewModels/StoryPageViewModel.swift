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
            let auxList = Bundle.main.decode([Story].self, from: "data.json")!
            dataModel = auxList[1]
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
        return dataModel?.pages.map({ $0.image })
    }

    var pageTexts: [String]? {
        guard let pageImage = dataModel?.pages else { return nil }
        return pageImage.map({ $0.image })
    }

//    var pageData: [(image: String, text: String)]? {
//        guard let pages = dataModel?.pages else { return nil }
//        return pages.map({ ($0.image, $0.text) })
//    }
}
