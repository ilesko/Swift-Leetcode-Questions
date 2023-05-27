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
 Output is the min `k`th inorder DFS value in the BST

 # Approach
 Store a reference to the index of the visited node.
 Update the min value when the `k`th node is visited.
 Initialize `currMin` to `Int.max` so any node value will update `currMin`.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.count`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    var i = 1
    
    func findK(_ root: TreeNode?, _ k: Int, _ currMin: inout Int) {
        guard let root = root else {
            return
        }
        
        findK(root.left, k, &currMin)
        if i == k {
            currMin = min(currMin, root.val)
        }
        i += 1
        findK(root.right, k, &currMin)
    }
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var currMin = Int.max
        findK(root, k, &currMin)
        return currMin
    }
}
