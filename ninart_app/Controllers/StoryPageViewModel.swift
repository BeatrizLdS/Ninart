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

    var pageImages: [String]? {
        return dataModel?.pages.map({ $0.image })
    }

    var pageTexts: [String]? {
        return dataModel?.pages.map({ $0.text }) ?? nil
    }
}
