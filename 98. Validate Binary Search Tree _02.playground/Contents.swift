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
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the call stack
 */

class Solution {
    func validate(_ root: TreeNode?, _ left: Int, _ right: Int) -> Bool {
        guard let root = root else {
            return true
        }
        
        if left >= root.val || root.val >= right {
            return false
        }
        
        
        return validate(root.left, left, root.val) && validate(root.right, root.val, right)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root, Int.min, Int.max)
    }
}
