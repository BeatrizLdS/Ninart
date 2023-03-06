//
//  jsonMap.swift
//  ninart_app
//
//  Created by Luciana Adrião on 17/06/22.
//

import Foundation

// MARK: - StoryElement

struct Story: Codable {

    let title: String
    let image: String
    let pages: [Page]

}

// MARK: - Page

struct Page: Codable {

    let image: String
    let text: String

}

struct AudioBook: Codable {
    let title: String
    let image: String
    let audioName: String
}

// MARK: decode JSON

extension Bundle {

    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T? {
        
        guard let urlQuery = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: urlQuery) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        do {
            let loaded = try decoder.decode(T.self, from: data)
            return loaded
        } catch(let error) {
            print(error)
        }

        return nil
    }
}
