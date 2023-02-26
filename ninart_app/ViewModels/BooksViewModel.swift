//
//  BooksViewModel.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 23/02/23.
//

import Foundation

class BooksViewModel {
    var continueBooksList: [[Story]] = []

    init() {
        for _ in 1...3 {
            let auxList = Bundle.main.decode([Story].self, from: "data.json")!
            continueBooksList.append(auxList)
        }
    }

    func getNumberOfBooksSections() -> Int? {
        return continueBooksList.count
    }

    func getCurrentList(section: Int) -> [Story] {
        return self.continueBooksList[section]
    }

    func getCurrentBook(section: Int, indexPath: IndexPath) -> Story {
        return self.continueBooksList[section][indexPath.row]
    }
}
