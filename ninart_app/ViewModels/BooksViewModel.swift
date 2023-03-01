//
//  BooksViewModel.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 23/02/23.
//

import Foundation

class BooksViewModel {
    private var continueBooksList: [Book] = []
    private var continueAudioBooksList: [AudioBook] = []
    private var booksList: [Book] = []
    private var audioBooksList: [AudioBook] = []

    init() {
        let listOfBook = Bundle.main.decode([Book].self, from: "data.json")!
        booksList = listOfBook

        let listOfAudioBooks = Bundle.main.decode([AudioBook].self, from: "audioBooks.json")!
        audioBooksList = listOfAudioBooks

        let startedBooks = Bundle.main.decode([Book].self, from: "data.json")!
        continueBooksList = startedBooks

        let startedAudioBooks = Bundle.main.decode([AudioBook].self, from: "audioBooks.json")!
        continueAudioBooksList = startedAudioBooks
    }

    func getNumberOfBooks() -> Int? {
        return booksList.count
    }

    func getNumberOfAudioBooks() -> Int? {
        return audioBooksList.count
    }

    func getNumberOfStartedStorys() -> Int? {
        let audioBooksCount = continueAudioBooksList.count
        let booksCount = continueBooksList.count
        let amount = audioBooksCount + booksCount
        return amount
    }

    func getNumberOfCategories() -> Int {
        var count = 0
        if getNumberOfBooks() != 0 {
            count += 1
        }
        if getNumberOfAudioBooks() != 0 {
            count += 1
        }
        if getNumberOfStartedStorys() != 0 {
            count += 1
        }
        return count
    }

    func getCurrentList(section: Int) -> Array<Any, Any> {
        var array = Array<Any, Any>()
        let numberOfCateries = getNumberOfCategories()
        switch section {
        case 0:
            if numberOfCateries == 3 {
                array.elements = continueAudioBooksList
                array.optionalElements = continueBooksList
            } else {
                array.elements = audioBooksList
            }
        case 1:
            if numberOfCateries == 3 {
                array.elements = audioBooksList
            } else {
                array.elements = booksList
            }
        case 2:
            array.elements = booksList
        default:
            array.elements = audioBooksList
            array.optionalElements = booksList
        }
        return array
    }

//    func getCurrentBook(section: Int, indexPath: IndexPath) -> Story {
//        return self.continueBooksList[section][indexPath.row]
//    }
}
