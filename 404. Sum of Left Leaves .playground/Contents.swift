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
 Append a node's value to sum when a left most leaf is found.

 # Approach
 A left most leaf meets the following conditions:
 1. `root.left != nil`
 2. `root.left.left == nil`
 3. `root.left.right == nil`

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var res = 0
        if let left = root.left, left.left == nil, left.right == nil {
            res = left.val
        }
        
        return res + sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)
    }
}

