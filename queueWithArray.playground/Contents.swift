/*
 Queue implementation using Array
 
 Basic features of Queue
 
 1. Queue is an ordered list of similar data type.
 2. Queue is a FIFO structure. (First in First out).
 3. Queue is said to be in Overflow state when it is completely full and is said to be in Underflow state if it is completely empty.
 
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

// queue implementation using array
public struct Queue<T> {
    private var arr = Array<T>()
    
    public mutating func dequeue() throws -> T? {
        
        if arr.isEmpty {
            throw QueueError.queueUnderFlow
        }else {
            let first = arr.removeFirst()
            return first
        }
    }
    
    public func peek() -> T? {
        return arr.first
    }
    
    public mutating func enqueue(item:T) throws {
        
        if isFull() {
            throw QueueError.queueOverFlow
        }
        
        arr.append(item)
    }
    
    public func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
    public func isFull() -> Bool {
        return arr.count == Constants.capacity
    }
}

// test one element
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: 10)
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
    try queue.enqueue(item: 10)
    try queue.enqueue(item: 20)
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
    try queue.enqueue(item: 10)
    try queue.enqueue(item: 20)
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
    try queue.enqueue(item: 10)
    try queue.enqueue(item: 20)
    try queue.enqueue(item: 30)
    XCTAssertTrue(queue.isFull())
    try queue.enqueue(item: 40)
}catch let er as QueueError {
    print("\(er)")
}


// test isFull
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: 10)
    try queue.enqueue(item: 20)
    try queue.enqueue(item: 30)
    XCTAssertTrue(queue.isFull())
    try queue.dequeue()
    XCTAssertFalse(queue.isFull())
    try queue.enqueue(item: 40)
}catch let er as QueueError {
    print("\(er)")
}


// test isEmpty
do {
    var queue = Queue<Int>()
    XCTAssertTrue(queue.isEmpty())
    try queue.enqueue(item: 10)
    try queue.enqueue(item: 20)
    try queue.enqueue(item: 30)
    XCTAssertTrue(queue.isFull())
    try queue.dequeue()
    try queue.dequeue()
    try queue.dequeue()
    XCTAssertTrue(queue.isEmpty())
}catch let er as QueueError {
    print("\(er)")
}

