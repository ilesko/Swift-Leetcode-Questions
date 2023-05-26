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
 The longest diameter is the max sum of any nodes left and right paths using post order DFS traversal.

 # Approach
 Use a helper function that returns a nodes max length of its left and right subtrees using post-order traversal.  Update `longestDiameter` property when a new max length if found.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.count`

 - Space complexity:
 O(1) or O(n) where n is the the depth of the tree (if counting the call stack as space)
 */

class Solution {
    var longestDiameter = 0

    func longestPath(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        let lLongest = longestPath(root.left)
        let rLongest = longestPath(root.right)

        longestDiameter = max(longestDiameter, lLongest + rLongest)
        return max(lLongest, rLongest) + 1
    }

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        longestPath(root)
        return longestDiameter
    }
}
