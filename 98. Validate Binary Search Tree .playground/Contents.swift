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
 Validate that the `root` DFS inorder value should always be greater than the previous `root` value.

 # Approach
 Perform inorder DFS traversal.
 Store the previous visited node.
 Check to see that `root.val` is greater than `prev.val`.
 Compare `root.val` to `Int.min` if the previous value is `nil`.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    var prev: TreeNode?
    
    func validate(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        let l = validate(root.left)
        guard root.val > (prev?.val ?? Int.min) else {
            return false
        }
        prev = root
        return l && validate(root.right)
        
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root)
    }
}
