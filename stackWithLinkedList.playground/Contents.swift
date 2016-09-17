/*
 Stack implementation using Linked List
 
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
    static let capacity = 3
}

// custom stack exception
public enum StackError : Error {
    case stackOverFlow
    case stackUnderFlow
}

//linked list node
public class Node<T> :CustomStringConvertible {
    var value:T
    var next:Node<T>?
    
    init(value:T) {
        self.value = value
    }
    
    public var description: String {
        return "\(value)"
    }
}

// stack implementation using linked list
public struct Stack<T> {
    private var nodeCount = 0
    private var start: Node<T>?
    
    public mutating func pop() throws -> Node<T>? {
        
        if let last = start {
            nodeCount = nodeCount - 1
            start = last.next
            return last
        }else {
            throw StackError.stackUnderFlow
        }
    }
    
    public func peek() -> Node<T>? {
        return start
    }
    
    public mutating func push(item:Node<T>) throws {
        
        if isFull() {
            throw StackError.stackOverFlow
        }
        
        nodeCount = nodeCount + 1
        item.next = start
        start = item
    }
    
    public func isEmpty() -> Bool {
        return (start == nil)
    }
    
    public func isFull() -> Bool {
        return (nodeCount == Constants.capacity)
    }
}

// test one element
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: Node<Int>(value:10))
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
    try st.push(item: Node<Int>(value:10))
    try st.push(item: Node<Int>(value:20))
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    st.peek()
    XCTAssertTrue(st.isEmpty())
}catch let er as StackError {
    print("\(er)")
}


// test stack UnderFlow
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: Node<Int>(value:10))
    try st.push(item: Node<Int>(value:20))
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    XCTAssertFalse(st.isEmpty())
    try st.pop()
    st.peek()
    XCTAssertTrue(st.isEmpty())
    try st.pop()
}catch let er as StackError {
    print("\(er)")
}


// test stack OverFlow
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: Node<Int>(value:10))
    try st.push(item: Node<Int>(value:20))
    try st.push(item: Node<Int>(value:30))
    XCTAssertTrue(st.isFull())
    try st.push(item: Node<Int>(value:40))
}catch let er as StackError {
    print("\(er)")
}



// test isFull
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: Node<Int>(value:10))
    try st.push(item: Node<Int>(value:20))
    try st.push(item: Node<Int>(value:30))
    XCTAssertTrue(st.isFull())
    try st.pop()
    XCTAssertFalse(st.isFull())
    try st.push(item: Node<Int>(value:40))
}catch let er as StackError {
    print("\(er)")
}


// test isEmpty
do {
    var st = Stack<Int>()
    XCTAssertTrue(st.isEmpty())
    try st.push(item: Node<Int>(value:10))
    try st.push(item: Node<Int>(value:20))
    try st.push(item: Node<Int>(value:30))
    XCTAssertTrue(st.isFull())
    try st.pop()
    try st.pop()
    try st.pop()
    XCTAssertTrue(st.isEmpty())
}catch let er as StackError {
    print("\(er)")
}

