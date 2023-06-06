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
 Assign a node's right subtree when `val > root.val`.
 Assign a node's left subtree when `val < root.val`.
 Return a node with a default value `val` when visiting a nil node.
 
 # Complexity
 - Time complexity:
 O(log n) where `n` is `root.nodes.size`
 O(n) worst case when the tree is unbalanced (like a one sided linked list)

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return TreeNode(val)
        }
        
        if val > root.val {
            root.right = root.right == nil ? TreeNode(val) : insertIntoBST(root.right, val)
        } else {
            root.left = root.left == nil ? TreeNode(val) : insertIntoBST(root.left, val)
        }
        return root
    }
}
