/*
 Selection Sort
 
 The algorithm divides the input list into two parts:
 the sublist of items already sorted, which is built up from left to right
 at the front (left) of the list, and the sublist of items remaining to be
 sorted that occupy the rest of the list. Initially, the sorted sublist is
 empty and the unsorted sublist is the entire input list. 
 The algorithm proceeds by finding the smallest (or largest, depending on
 sorting order) element in the unsorted sublist, exchanging (swapping) it
 with the leftmost unsorted element (putting it in sorted order), and moving
 the sublist boundaries one element to the right.
 
 More Info: https://en.wikipedia.org/wiki/Selection_sort
 */

import XCTest

public func selectionSort(array:Array<Int>) -> Array<Int> {
    var tArray = array
    for i in 0..<tArray.count - 1 {
        var position = i
        var smallestItemPosition = position
        while position < tArray.count {
            if tArray[smallestItemPosition] > tArray[position] {
                smallestItemPosition = position
            }
            position = position + 1
        }
        
        if i != smallestItemPosition {
            swap(&tArray[i], &tArray[smallestItemPosition])
        }
    }
    
    return tArray
}

//Test Average case Sorting
let input1 = [6,4,5,8,2,3,1,0,9,7]
let target1 = [0,1,2,3,4,5,6,7,8,9]
let result1 = selectionSort(array: input1)
XCTAssertEqual(result1, target1)

//Test one element
let input2 = [0]
let target2 = [0]
let result2 = selectionSort(array: input2)
XCTAssertEqual(result2, target2)

//Test two element
let input3 = [1,0]
let target3 = [0,1]
let result3 = selectionSort(array: input3)
XCTAssertEqual(result3, target3)

//Test Worst case
let input4 = [9,8,7,6,5,4,3,2,1,0]
let target4 = [0,1,2,3,4,5,6,7,8,9]
let result4 = selectionSort(array: input4)
XCTAssertEqual(result4, target4)
