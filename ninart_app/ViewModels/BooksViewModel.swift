//
//  BooksViewModel.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 23/02/23.
//

import Foundation

class BooksViewModel {
    private var continueBooksList: [Story] = []
    private var continueAudioBooksList: [AudioBook] = []
    private var booksList: [Story] = []
    private var audioBooksList: [AudioBook] = []

    init() {
        loadBooks()
        loadAudioBooks()
    }

    private func loadBooks() {
        let languageStr = Locale.current.languageCode
        let listOfBook = Bundle.main.decode([Story].self, from: "data-\(languageStr!).json")!
//        let startedBooks = Bundle.main.decode([Story].self, from: "data-\(languageStr!).json")!
        booksList = listOfBook
//        continueBooksList = startedBooks
    }

    private func loadAudioBooks() {
        let languageStr = Locale.current.languageCode
        let listOfAudioBooks = Bundle.main.decode([AudioBook].self, from: "audioBooks-\(languageStr!).json")!
//        let startedAudioBooks = Bundle.main.decode([AudioBook].self, from: "audioBooks-\(languageStr!).json")!
        audioBooksList = listOfAudioBooks
//        continueAudioBooksList = startedAudioBooks
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
                array.addList(continueAudioBooksList)
                array.addList(continueBooksList)
            } else {
                array.addList(audioBooksList)
            }
        case 1:
            if numberOfCateries == 3 {
                array.addList(audioBooksList)
            } else {
                array.addList(booksList)
            }
        case 2:
            array.addList(booksList)
        default:
            array.addList(audioBooksList)
            array.addList(booksList)
        }
        return array
    }

    func searchStoryForTitle(title: String) -> Story? {
        return booksList.first(where: {$0.title == title})
    }

    func searchAudioBookForTitle(title: String) -> AudioBook? {
        return audioBooksList.first(where: {$0.title == title})
    }
}
