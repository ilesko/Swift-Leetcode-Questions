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
 Run a preorder DFS until a nil `root.right` `nil` value is found.

 # Approach
 Return `0` if root is nil.  Use preorder DFS to increment an accumulator for each `root.left` and `root.right` node is found.  Stop searching when a nil `root.right` node is found.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.count`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    
    var acc = 1
    
    func dfsAccumulate(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        acc += root.left == nil ? 0 : 1
        
        if root.right != nil {
            acc += 1
        } else {
            return
        }
        
        dfsAccumulate(root.left)
        dfsAccumulate(root.right)
    }
    
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        dfsAccumulate(root)
        return acc
    }
}
