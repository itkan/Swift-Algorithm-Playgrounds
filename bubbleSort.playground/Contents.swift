/*
 Bubble Sort
 
 Bubble sort, sometimes referred to as sinking sort,
 is a simple sorting algorithm that repeatedly steps through the list to be sorted,
 compares each pair of adjacent items and swaps them if they are in the wrong order.
 The pass through the list is repeated until no swaps are needed,
 which indicates that the list is sorted.
*/

import XCTest

public func bubbleSort(array:Array<Int>) -> Array<Int> {
    var tArray = array
    for i in 0..<tArray.count-1 {
        for j in 0..<(tArray.count-1-i) {
            if tArray[j] > tArray[j+1] {
                let t = tArray[j]
                tArray[j] = tArray[j+1]
                tArray[j+1] = t
            }
        }
    }
    
    return tArray
}

//Test Sorting
let input = [6,4,5,8,2,3,1,0,9,7]
let target = [0,1,2,3,4,5,6,7,8,9]
let result = bubbleSort(array: input)
XCTAssertEqual(result, target)
