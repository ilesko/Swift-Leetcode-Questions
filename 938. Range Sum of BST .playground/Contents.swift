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
 Use DFS to only traverse the subtrees where `low <= root.val <= high`

 # Approach
 Use DFS to traverse the tree.
 Ignore left subtrees where `root.val` is less than `low`.
 Ignore right subtrees where `root.val` is greatert han `high`.
 This approach only works since the input is a binary search tree.

 # Complexity
 - Time complexity:
 O(log n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the call stack
 */

class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        var ans = 0
        
        if low <= root.val && root.val <= high {
            ans += root.val
        }
        
        if low < root.val {
            ans += rangeSumBST(root.left, low, high)
        }
        
        if root.val < high {
            ans += rangeSumBST(root.right, low, high)
        }
        
        return ans
    }
}
