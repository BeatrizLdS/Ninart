//
//  ArrayModel.swift
//  ninart_app
//
//  Created by Beatriz Leonel da Silva on 01/03/23.
//

import Foundation

struct Array<FirstElement, SecondElement> {
    private var firtsElementList: [FirstElement] = []
    private var secondElementList: [SecondElement] = []
    func get(index: Int) -> Any {
        if index < firtsElementList.count {
            return firtsElementList[index]
        } else {
            return secondElementList[index - firtsElementList.count]
        }
    }
    func getNumberOfElements() -> Int {
        let countFirtsList = firtsElementList.count
        let countSecondList = secondElementList.count
        return countFirtsList + countSecondList
    }
    mutating func addList<Element>(_ list: [Element]) {
        if firtsElementList.isEmpty {
            let officialList = list as! [FirstElement]
            firtsElementList = officialList
        } else {
            let officialList = list as! [SecondElement]
            secondElementList = officialList
        }
    }
}
