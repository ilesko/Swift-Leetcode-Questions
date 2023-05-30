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
 A grandparent is always two nodes deep

 # Approach
 Append node value if either `root.left.left`, `root.left.right`, `root.right.left`, and `root.right.right` are not `nil`.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var res = 0
        if root.val % 2 == 0 {
            if let l = root.left {
                res += l.left?.val ?? 0
                res += l.right?.val ?? 0
            }
            
            if let r = root.right {
                res += r.left?.val ?? 0
                res += r.right?.val ?? 0
            }
        }
        
        return res + sumEvenGrandparent(root.left) + sumEvenGrandparent(root.right)
    }
}
