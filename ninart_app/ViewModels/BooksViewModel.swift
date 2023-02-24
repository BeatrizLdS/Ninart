//
//  BooksViewModel.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 23/02/23.
//

import Foundation

class BooksViewModel {
    var continueBooksList: [Story] = []

    init() {
        continueBooksList = Bundle.main.decode([Story].self, from: "data.json")!
    }

    func getNumberOfContinueBooks() -> Int? {
        return continueBooksList.count
    }

    func getCurrentBook(indexPath: IndexPath) -> Story {
        return self.continueBooksList[indexPath.row]
    }
}
