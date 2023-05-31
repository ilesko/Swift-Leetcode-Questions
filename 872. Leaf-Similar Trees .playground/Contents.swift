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
 The preorder DFS values of `root1` and `root2` leaves should be equal

 # Approach
 Create a helper function that returns the pre order DFS values of a `TreeNode`.
 Return the equality of the two arrays.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root1.nodes.size` + `root2.nodes.size`

 - Space complexity:
 O(n) where `n` is `root1.leaves.count` + `root2.leaves.count`
 */

class Solution {
    func leafVals(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        return (root.left == nil && root.right == nil) ? [root.val] : [] + leafVals(root.left) + leafVals(root.right)
    }
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        return leafVals(root1) == leafVals(root2)
    }
}
