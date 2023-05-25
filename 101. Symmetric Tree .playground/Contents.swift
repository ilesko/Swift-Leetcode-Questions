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
 The pre-order values of `root.left` traversing `left -> right` subtrees should equal the pre-order values of `root.right` traversion `right -> left` subtrees.

 # Approach
 Store an array of visited pre-order values for `root.left` and `root.right`. The values are visited in a horizontally flipped order. `-1` values are used to represent empty nodes.  It is important to track where the empty nodes are.

 # Complexity
 Time complexity:
 O(n) where n is the number of nodes in `root`.

 Space complexity:
 O(n) where n is the number of nodes in root. -1 values will take up at most 2 * root.leaves space.
 
 # Notes
 This may not be the most optimal recursive solution, but it does work.
 */

class Solution {
    func preOrderDFSLeftFirst(_ root: TreeNode?, arr: inout [Int]) {
        guard let root = root else {
            arr.append(-1)
            return
        }
        
        arr.append(root.val)
        preOrderDFSLeftFirst(root.left, arr: &arr)
        preOrderDFSLeftFirst(root.right, arr: &arr)
    }
    
    func preOrderDFSRightFirst(_ root: TreeNode?, arr: inout [Int]) {
        guard let root = root else {
            arr.append(-1)
            return
        }
        arr.append(root.val)
        preOrderDFSRightFirst(root.right, arr: &arr)
        preOrderDFSRightFirst(root.left, arr: &arr)
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return false
        }
        
        var leftArr = [Int](), rightArr = [Int]()
        preOrderDFSLeftFirst(root.left, arr: &leftArr)
        preOrderDFSRightFirst(root.right, arr: &rightArr)
        return leftArr == rightArr
    }
}
