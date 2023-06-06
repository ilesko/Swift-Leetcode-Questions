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
 # Intuition/Approach
 Traverse a node's right subtree when `val > root.val`.
 Traverse a node's left subtree when `val < root.val`.
 Return root when `root.val == val`.
 Return `nil` if `val` is not found.
 
 # Complexity
 - Time complexity:
 O(log n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

// Verbose
class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root.val == val {
            return root
        } else if val > root.val {
            return searchBST(root.right, val)
        }
        
        return searchBST(root.left, val)
    }
    
    func sBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        return root.val == val ? root : sBST(val > root.val ? root.right : root.left, val)
    }
}
