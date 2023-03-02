//
//  ArrayModel.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 01/03/23.
//

import Foundation

struct Array<Element1, Element2> {
    var elements: [Element1] = []
    var optionalElements: [Element2] = []
    func get(index: Int) -> Any {
        if index < elements.count {
            return elements[index]
        } else {
            return optionalElements[index - elements.count]
        }
    }
}
