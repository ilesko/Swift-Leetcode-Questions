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
 Use preorder traversal until `val` is found.

 # Approach
 Create a helper function that uses preorder DFS traversal.
 Store the result in an optional `TreeNode` property.
 Exit the helper function when `root.val == val`

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    
    func depth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return max(depth(root.left), depth(root.right)) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }

        return abs(depth(root.left) - depth(root.right)) <= 1
    }
}

