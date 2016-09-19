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

//Test Average case Sorting
let input1 = [6,4,5,8,2,3,1,0,9,7]
let target1 = [0,1,2,3,4,5,6,7,8,9]
let result1 = bubbleSort(array: input1)
XCTAssertEqual(result1, target1)

//Test one element
let input2 = [0]
let target2 = [0]
let result2 = bubbleSort(array: input2)
XCTAssertEqual(result2, target2)

//Test two element
let input3 = [1,0]
let target3 = [0,1]
let result3 = bubbleSort(array: input3)
XCTAssertEqual(result3, target3)

//Test Worst case
let input4 = [9,8,7,6,5,4,3,2,1,0]
let target4 = [0,1,2,3,4,5,6,7,8,9]
let result4 = bubbleSort(array: input4)
XCTAssertEqual(result4, target4)
