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
 Use inorder DFS to update the node's values (traverse right -> left subtrees)

 # Approach
 Use inorder DFS to traverse the tree (traversing the right tree first, then left).
 Keep prefix sum of nodes's values.
 Update each node's value to `sum + root.val`

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(h) where `h` is the height of the tree
 */


class Solution {
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if let left = root.left {
            if left.val < low {
                root.left = left.right
            }
        }
        
        if let right = root.right {
            if right.val > high {
                root.right = right.left
            }
        }
        
        let _ = trimBST(root.left, low, high)
        let _ = trimBST(root.right, low, high)
        
        return root
    }
}
