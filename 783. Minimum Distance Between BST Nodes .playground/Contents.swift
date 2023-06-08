import UIKit
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
 Use inorder DFS since the answer will always the minimum difference between two adjacent nodes in ascending order.

 # Approach
 Traverse the tree using DFS inorder traversal.
 Store the previous visited node.
 Find the difference between the current node and the previous node.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(h) where `h` is the height of the tree
 */

class Solution {
    
    var prev: TreeNode?
    
    func evaluate(_ root: TreeNode?, _ currMin: inout Int) {
        guard let root = root else {
            return
        }
        
        evaluate(root.left, &currMin)
        if let prev = prev {
            print(root.val, prev.val, root.val - prev.val)
            currMin = min(currMin, root.val - prev.val)
        }
        prev = root
        evaluate(root.right, &currMin)
    }
    
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var ans = Int.max
        evaluate(root, &ans)
        return ans
    }
}
