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
 The result can only be the minimum difference between two adjacent nodes traversing in DFS inorder value.  This approach only works because the tree is a binary search tree.

 # Approach
 Use inorder DFS to traverse the tree.
 Store the previous value.
 Return `min(currentMin, root.val - previous.val)`

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    
    var prev: Int?
    
    func findMinDiff(_ root: TreeNode?, _ currMin: inout Int) {
        guard let root = root else {
            return
        }
        
        findMinDiff(root.left, &currMin)
        if let previous = prev {
            currMin = min(currMin, root.val - previous)
        }
        
        prev = root.val
        findMinDiff(root.right, &currMin)
    }
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var ans = Int.max
        findMinDiff(root, &ans)
        return ans
    }
}

