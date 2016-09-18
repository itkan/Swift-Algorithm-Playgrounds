/*
 Binary Search Tree
 
 A binary search tree have benefits of both an ordered array and a linked list,
 as search is as quick as in sorted array and insertion or deletion operation 
 are as fast as in linked list.
 
 Rules:
 A node's left child must have value less than its parent's value and
 node's right child must have value greater than it's parent value.
 
 A binary tree has a special condition that each node can have two children at maximum.
 
 Basic Operations
 
 1. Insert − insert an element in a tree / create a tree.
 2. Search − search an element in a tree.
 3. Preorder Traversal − traverse a tree in a preorder manner.
 4. Inorder Traversal − traverse a tree in an inorder manner.
 5. Postorder Traversal − traverse a tree in a postorder manner.
*/

import XCTest

//linked list node
public class Node<T> where T:Comparable {
    var value:T
    var left:Node<T>?
    var right:Node<T>?
    
    init(value:T) {
        self.value = value
    }
    
    public var inorder: String {
        var s = ""
        if let left = left {
            s += "\(left.inorder) "
        }
        s += "\(value)"
        if let right = right {
            s += " \(right.inorder)"
        }
        return s
    }
    
    public var preorder: String {
        var s = ""
        s += "\(value)"
        if let left = left {
            s += " \(left.preorder)"
        }
        if let right = right {
            s += " \(right.preorder)"
        }
        return s
    }
    
    public var postorder: String {
        var s = ""
        if let left = left {
            s += "\(left.postorder) "
        }
        if let right = right {
            s += "\(right.postorder) "
        }
        s += "\(value)"
        return s
    }
}

public struct BinarySearchTree<T> where T:Comparable {
    var root:Node<T>?
    
    private func insert(node:Node<T>, parent:Node<T>) {
        
        if parent.value > node.value {
            //left tree
            
            guard let left = parent.left else {
                parent.left = node
                return
            }
            
            insert(node: node, parent: left)
            
        }else {
            //right tree
            
            guard let right = parent.right else {
                parent.right = node
                return
            }
            
            insert(node: node, parent: right)
        }
    }
    
    public mutating func insert(value:T) {
        let node = Node<T>(value: value)
        
        guard let tRoot = root else {
            root = node
            return
        }
        
        insert(node: node, parent: tRoot)
    }
    
    public mutating func insert(array:[T]) {
        for item in array {
            insert(value: item)
        }
    }
    
    public func search(value:T) -> Bool {
        return search(value: value, parent: root)
    }
    
    private func search(value:T, parent:Node<T>?) -> Bool {
        
        guard let currentNode = parent else {
            return false
        }
        
        if currentNode.value == value {
            return true
        }else if currentNode.value > value {
            return search(value: value, parent: currentNode.left)
        }else {
            return search(value: value, parent: currentNode.right)
        }
    }
}

//Execution
var tree = BinarySearchTree<Int>()
tree.insert(array: [6,6,3,8,0,5,7,3,0,9])
print("inorder \(tree.root!.inorder)")
print("preorder \(tree.root!.preorder)")
print("postorder \(tree.root!.postorder)")

//Test Search
XCTAssertFalse(tree.search(value: 12))
tree.insert(value: 12)
XCTAssertTrue(tree.search(value: 12))