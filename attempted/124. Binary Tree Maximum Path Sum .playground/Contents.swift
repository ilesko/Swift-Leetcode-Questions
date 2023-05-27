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
    var root: TreeNode?
    var maxPathSum = 0
    
    func dfsMaxPath(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let l = dfsMaxPath(root.left)
        let r = dfsMaxPath(root.right)
        var maxPath = 0
        if root === self.root {
            maxPath = max(root.val,
                          root.val + l,
                          root.val + r,
                          root.val + l + r)
        } else {
            maxPath = max(root.val,
                          root.val + l,
                          root.val + r)
        }
        print(root.val, maxPath, l, r)
        
        maxPathSum = max(maxPathSum, maxPath)
        return maxPath
    }
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        self.root = root
        maxPathSum = root?.val ?? 0
        dfsMaxPath(root)
        return maxPathSum
    }
}
