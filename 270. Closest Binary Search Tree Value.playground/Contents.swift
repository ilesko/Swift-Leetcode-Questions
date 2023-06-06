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
 Brute force check each node

 # Approach
 Use inorder DFS to traverse to each node.
 Find the absolute difference between `root.val` and `target`.
 Store the minimum difference found.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the call stack
 */

class Solution {
    func evaluate(_ root: TreeNode?, _ target: Double, _ min: inout Double, _ res: inout Int) {
        guard let root = root else {
            return
        }
        
        evaluate(root.left, target, &min, &res)
        let val = abs(target - Double(root.val))
        if val < min {
            min = val
            res = root.val
        }
        evaluate(root.right, target, &min, &res)
    }
    
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        var min = Double(Int.max), res = 0
        evaluate(root, target, &min, &res)
        return res
    }
}
