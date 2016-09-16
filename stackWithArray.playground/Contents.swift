/*
 Stack implementation using Array
 
 Basic features of Stack
 
  1. Stack is an ordered list of similar data type.
  2. Stack is a LIFO structure. (Last in First out).
  3. Stack is said to be in Overflow state when it is completely full and is said to be in Underflow state if it is completely empty.
 
 Basic Operations
 
  1. push() − pushing (storing) an element on the stack.
  2. pop() − removing (accessing) an element from the stack.
  3. peek() − get the top data element of the stack, without removing it.
  4. isFull() − check if stack is full.
  5. isEmpty() − check if stack is empty.
*/

import XCTest

// configurable values defined at one place
public struct Constants {
    static let stackSize = 3
}

// custom stack exception
public enum StackError : Error {
    case stackOverFlow
    case stackUnderFlow
}

// stack implementation using array
public struct Stack<T> {
    private var arr = Array<T>()
    
    public mutating func pop() throws -> T? {
        
        if arr.isEmpty {
            throw StackError.stackUnderFlow
        }else {
            let last = arr.removeLast()
            return last
        }
    }
    
    public func peek() -> T? {
        return arr.last
    }
    
    public mutating func push(item:T) throws {
        
        if isFull() {
            throw StackError.stackOverFlow
        }
        
        arr.append(item)
    }
    
    public func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
    public func isFull() -> Bool {
        return arr.count == Constants.stackSize
    }
}

// test one element
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: 10)
    XCTAssertFalse(st.isEmpty())
    st.peek()
    try st.pop()
    XCTAssertTrue(st.isEmpty())
}catch let er as StackError {
    print("\(er)")
}

// test two element
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: 10)
    try st.push(item: 20)
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    XCTAssertTrue(st.isEmpty())
}catch let er as StackError {
    print("\(er)")
}

// test stack UnderFlow
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: 10)
    try st.push(item: 20)
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    XCTAssertTrue(st.isEmpty())
    try st.pop()
}catch let er as StackError {
    print("\(er)")
}


// test stack OverFlow
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: 10)
    try st.push(item: 20)
    try st.push(item: 30)
    XCTAssertTrue(st.isFull())
    try st.push(item: 40)
}catch let er as StackError {
    print("\(er)")
}



// test isFull
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: 10)
    try st.push(item: 20)
    try st.push(item: 30)
    XCTAssertTrue(st.isFull())
    try st.pop()
    XCTAssertFalse(st.isFull())
    try st.push(item: 40)
}catch let er as StackError {
    print("\(er)")
}


// test isEmpty
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: 10)
    try st.push(item: 20)
    try st.push(item: 30)
    XCTAssertTrue(st.isFull())
    try st.pop()
    try st.pop()
    try st.pop()
    XCTAssertTrue(st.isEmpty())
}catch let er as StackError {
    print("\(er)")
}

