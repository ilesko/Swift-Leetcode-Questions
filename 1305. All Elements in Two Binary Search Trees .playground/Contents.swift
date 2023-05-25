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
 Create in-order DFS arrays from `root1` and `root2`, combine, then sort.

 # Approach
 Create a helper function, `getInOrderElements` that returns an array of DFS in-order `Int` values from a `TreeNode` object.  Return the sorted result of combining both arrays.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root1.nodes.count` + `root2.nodes.count`

 - Space complexity:
 O(n) where `n` is `root1.nodes.count` + `root2.nodes.count`
 */

class Solution {
    
    func getInOrderElements(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        return getInOrderElements(root.left) + [root.val] + getInOrderElements(root.right)
    }
    
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        return (getInOrderElements(root1) + getInOrderElements(root2)).sorted()
    }
}
