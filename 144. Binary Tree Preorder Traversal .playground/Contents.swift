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
 Use depth first search to visit each node in `root`.

 # Approach
 This approach works by appending `[root.val]` to the result in the order that each node is pushed to the call stack.

 # Complexity
 - Time complexity:
 O(n) where `n` is the number of nodes in `root`.

 - Space complexity:
 O(n) where `n` is the number of nodes in `root`.
 */

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        return [root.val] + preorderTraversal(root.left) + preorderTraversal(root.right)
    }
}
