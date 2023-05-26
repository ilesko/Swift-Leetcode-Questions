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

class Solution {
    
    func dfs(_ root: TreeNode?, _ targetSum: Int, _ currSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        if root.left == nil && root.right == nil {
            return root.val + currSum == targetSum
        }
        
        return dfs(root.left, targetSum, currSum + root.val) || dfs(root.right, targetSum, currSum + root.val)
    }
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        return dfs(root, targetSum, 0)
    }
}

Solution().hasPathSum(nil, 2)
