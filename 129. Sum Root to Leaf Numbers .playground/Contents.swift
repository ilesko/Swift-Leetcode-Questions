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
 Keep track of the current root to leaf sum by multiplying the sum by 10 each level

 # Approach
 Use a preorder DFS helper function that keeps track of the current path value.  The value is multiplied by 10 for each level. `root.val + path value` is added to the accumulated value when a leaf is found.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.count`

 - Space complexity:
 O(1) or O(n) if `n` is the depth of the call stack.
 */

class Solution {
    
    func rootToLeafSum(_ root: TreeNode?, currSum: Int, res: inout Int) {
        guard let root = root else {
            return
        }
        
        if root.left == nil && root.right == nil {
            res += (currSum * 10) + root.val
            return
        }
        
        rootToLeafSum(root.left, currSum: (currSum * 10) + root.val, res: &res)
        rootToLeafSum(root.right, currSum: (currSum * 10) + root.val, res: &res)
    }
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        rootToLeafSum(root, currSum: 0, res: &res)
        return res
    }
}
