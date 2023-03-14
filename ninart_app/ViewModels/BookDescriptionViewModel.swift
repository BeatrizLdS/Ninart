//
//  BookDescriptionViewModel.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 07/03/23.
//

import Foundation

class BookDescriptionViewModel {
    private var story: Story?
    private var audioBook: AudioBook?

    init(story: Story? = nil, audioBook: AudioBook? = nil) {
        self.story = story
        self.audioBook = audioBook
    }

    func getAudioBook() -> AudioBook? {
        return audioBook
    }

    func getStory() -> Story? {
        return story
    }

    func getImageDescription() -> String {
        if let description = story?.imageDescription {
            return description
        } else {
            let description = audioBook?.imageDescription
            return description!
        }
    }
}
