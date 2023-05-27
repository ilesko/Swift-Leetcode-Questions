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
    func maxRightDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        return max(maxRightDepth(root.left), maxRightDepth(root.right)) + 1
    }
    
    func included(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        return [root.val] + included(root.right)
    }
    
    func conditional(_ root: TreeNode?, _ currLDepth: Int, _ rDepth: Int) -> [Int] {
        guard let root = root else {
            return []
        }
        
        let l = conditional(root.left, currLDepth + 1, rDepth)
        let r = conditional(root.right, currLDepth + 1, rDepth)
        return currLDepth > rDepth ? [root.val] : [] + l + r
    }
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        let rHeight = maxRightDepth(root) + (root.right == nil ? 0 : 1)
        print(rHeight)
        return included(root) + conditional(root, 1, rHeight)
    }
}
