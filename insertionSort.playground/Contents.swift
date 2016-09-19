/*
 Insertion Sort
 
 Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
 Each iteration, insertion sort removes one element from the input data, finds the location it belongs
 within the sorted list, and inserts it there. It repeats until no input elements remain.

 More Info: https://en.wikipedia.org/wiki/Insertion_sort#Algorithm_for_insertion_sort
 */

import XCTest

public func insertionSort(array:Array<Int>) -> Array<Int> {
    guard array.count > 1 else { return array }
    
    var tArray = array
    for i in 1..<tArray.count {
        let currentItem = tArray[i]
        var position = i
        while position > 0 && currentItem < tArray[position - 1] {
            tArray[position] = tArray[position - 1]
            position = position - 1
        }
        tArray[position] = currentItem
    }
    
    return tArray
}

//Test Average case Sorting
let input1 = [6,4,5,8,2,3,1,0,9,7]
let target1 = [0,1,2,3,4,5,6,7,8,9]
let result1 = insertionSort(array: input1)
XCTAssertEqual(result1, target1)

//Test one element
let input2 = [0]
let target2 = [0]
let result2 = insertionSort(array: input2)
XCTAssertEqual(result2, target2)

//Test two element
let input3 = [1,0]
let target3 = [0,1]
let result3 = insertionSort(array: input3)
XCTAssertEqual(result3, target3)

//Test Worst case
let input4 = [9,8,7,6,5,4,3,2,1,0]
let target4 = [0,1,2,3,4,5,6,7,8,9]
let result4 = insertionSort(array: input4)
XCTAssertEqual(result4, target4)