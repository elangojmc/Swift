//: Playground - noun: a place where people can play

import UIKit
import Foundation

extension Array where Element: Comparable {

    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) { // 1
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) { // 2
                data.swapAt(j, j + 1)
            }
        }
        return data
    }
}

let new = [10,25,36,85,14,10,22,36,14,88,22,88,99,88]

new.sorted()

new.bubbleSort()

