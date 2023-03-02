//
//  StoryPageViewModel.swift
//  ninart_app
//
//  Created by Marcelo De Araújo on 28/02/23.
//

import Foundation
import UIKit

class StoryPageViewModel {

    var dataModel: Story?

    func loadData() {
        if let data = Bundle.main.url(forResource: "data", withExtension: "json") {
                let auxList = Bundle.main.decode([Story].self, from: "data.json")!
                dataModel = auxList[1]
        }
    }

    var title: String? {
        print(dataModel?.title)
        return dataModel?.title
    }

    var pageImages: [String]? {
//        print(dataModel?.image)
        return dataModel?.pages.map({ $0.image })
    }

    var pageTexts: [String]? {
//        return dataModel?.pages
        return dataModel?.pages.map({ $0.text }) ?? nil
    }
}
