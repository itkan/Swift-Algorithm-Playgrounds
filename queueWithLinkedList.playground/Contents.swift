/*
 Queue implementation using Linked List
 
 Basic features of Queue
 
 1. Queue is an ordered list of similar data type.
 2. Queue is a FIFO structure. (First in First out).
 
 Basic Operations
 
 1. enqueue() − add (store) an item to the queue.
 2. dequeue() − remove (access) an item from the queue.
 3. peek() − get the element at front of the queue without removing it.
 4. isfull() − checks if queue is full.
 5. isempty() − checks if queue is empty.
 */


import XCTest

// configurable values defined at one place
public struct Constants {
    static let capacity = 3
}


// custom Queue exception
public enum QueueError : Error {
    case queueOverFlow
    case queueUnderFlow
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
public struct Queue<T> {
    private var start: Node<T>?
    private var end: Node<T>?
    
    public mutating func dequeue() throws -> Node<T>? {
        
        if let first = start {
            start = first.next
            
            if start == nil {
                end = nil
            }
            
            return first
        }else {
            throw QueueError.queueUnderFlow
        }
    }
    
    public func peek() -> Node<T>? {
        return start
    }
    
    public mutating func enqueue(item:Node<T>) throws {
        
        if isFull() {
            throw QueueError.queueOverFlow
        }
        
        if start == nil {
            start = item
            end = item
        }else {
            end?.next = item
            end = item
        }
    }
    
    public func isEmpty() -> Bool {
        return (start == nil)
    }
    
    public func isFull() -> Bool {
        return (count() == Constants.capacity)
    }
    
    private func count() -> Int {
        guard start != nil else {return 0}
        
        var result = 0
        var current = start
        
        while current != nil {
            result = result + 1
            current = current?.next
        }
        
        return result
    }
}

// test one element
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: Node<Int>(value: 10))
    XCTAssertFalse(queue.isEmpty())
    queue.peek()
    try queue.dequeue()
    XCTAssertTrue(queue.isEmpty())
}catch let er as QueueError {
    print("\(er)")
}

// test two element
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: Node<Int>(value: 10))
    try queue.enqueue(item: Node<Int>(value: 20))
    XCTAssertFalse(queue.isEmpty())
    try queue.dequeue()
    XCTAssertFalse(queue.isEmpty())
    try queue.dequeue()
    XCTAssertTrue(queue.isEmpty())
}catch let er as QueueError {
    print("\(er)")
}

// test Queue UnderFlow
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: Node<Int>(value: 10))
    try queue.enqueue(item: Node<Int>(value: 20))
    XCTAssertFalse(queue.isEmpty())
    try queue.dequeue()
    XCTAssertFalse(queue.isEmpty())
    try queue.dequeue()
    XCTAssertTrue(queue.isEmpty())
    try queue.dequeue()
}catch let er as QueueError {
    print("\(er)")
}


// test Queue OverFlow
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: Node<Int>(value: 10))
    try queue.enqueue(item: Node<Int>(value: 20))
    try queue.enqueue(item: Node<Int>(value: 30))
    XCTAssertTrue(queue.isFull())
    try queue.enqueue(item: Node<Int>(value: 40))
}catch let er as QueueError {
    print("\(er)")
}


// test isFull
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: Node<Int>(value: 10))
    try queue.enqueue(item: Node<Int>(value: 20))
    try queue.enqueue(item: Node<Int>(value: 30))
    XCTAssertTrue(queue.isFull())
    try queue.dequeue()
    XCTAssertFalse(queue.isFull())
    try queue.enqueue(item: Node<Int>(value: 40))
}catch let er as QueueError {
    print("\(er)")
}


// test isEmpty
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: Node<Int>(value: 10))
    try queue.enqueue(item: Node<Int>(value: 20))
    try queue.enqueue(item: Node<Int>(value: 30))
    XCTAssertTrue(queue.isFull())
    try queue.dequeue()
    try queue.dequeue()
    try queue.dequeue()
    XCTAssertTrue(queue.isEmpty())
}catch let er as QueueError {
    print("\(er)")
}
