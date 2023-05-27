import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BSTIterator {
    
    var store = [Int]()

    init(_ root: TreeNode?) {
        storeInOrder(root, &store)
    }
    
    func storeInOrder(_ root: TreeNode?, _ arr: inout [Int]) {
        guard let root = root else {
            return
        }
        
        storeInOrder(root.left, &arr)
        arr.append(root.val)
        storeInOrder(root.right, &arr)
    }
    
    func next() -> Int {
        return store.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !store.isEmpty
    }
}
