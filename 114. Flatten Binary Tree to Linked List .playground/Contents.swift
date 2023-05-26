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

/**
 # Intuition
 Create a new linked list using a TreeNode `.right` values from `root`'s preorder DFS values.

 # Approach
 Store each of `root`'s preorder DFS values into an array.  Create a new TreeNode and treat it as a linked list, only setting it's `next`, or `right` property.  Set `root.left` to `nil` and `root.right` to `new.right`.  This ensure's that root's value does not change.

 # Complexity
 - Time complexity:
 O(n) where n is the number of nodes in `root`.

 - Space complexity:
 O(n) where n is the number of nodes in `root`.
 
 # Note
 This is not an in place solution and it is a bit brute force-ish
 */

class Solution {
    
    func dfsToList(_ root: TreeNode?, _ store: inout [Int]) {
        guard let root = root else {
            return
        }
        
        store.append(root.val)
        dfsToList(root.left, &store)
        dfsToList(root.right, &store)
    }
    
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        var store = [Int]()
        dfsToList(root, &store)
        var new = TreeNode(store.removeFirst())
        var curr = new
        while !store.isEmpty {
            let next = TreeNode(store.removeFirst())
            curr.right = next
            curr = next
        }
        
        root.left = nil
        root.right = new.right
    }
}
