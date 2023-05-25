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
 Use recursion to determine if a path to a leaf equals target sum.

 # Approach
 Use DFS helper function to return an array of valid paths.  The current path and current sum are passed in as parameters to keep track of the values until `root` is visited.  Conditional logic is performed when a leaf is found (`root.left` and `root.right` are `nil`)

 # Complexity
 - Time complexity:
 O(n) where `n` is the number of nodes in `root`.

 - Space complexity:
 O(n) where `n` is the number of nodes in `root`.
 */

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        return dfsPathSum(root, [], currSum: 0, target: targetSum)
    }
    
    func dfsPathSum(_ root: TreeNode?, _ path: [Int], currSum: Int, target: Int) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        // Use DFS
        let l = dfsPathSum(root.left, path + [root.val], currSum: currSum + root.val, target: target)
        let r = dfsPathSum(root.right, path + [root.val], currSum: currSum + root.val, target: target)
        
        var res = l + r
        
        // Check if root to leaf path == target
        if root.left == nil && root.right == nil {
            if currSum + root.val == target {
                res += [path + [root.val]]
            }
        }
        
        return res
    }
}
