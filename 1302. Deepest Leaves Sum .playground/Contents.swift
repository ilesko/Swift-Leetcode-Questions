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
 Keep a running total of the current row using BFS

 # Approach
 Use BFS to iterate over each row in the tree.
 Keep a running total of each row.
 Reset the total to 0 at the start of each row.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(n/2 + 1) or O(n)
 */

class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var res = 0, queue = [root]
        while !queue.isEmpty {
            res = 0
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                res += node.val
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        
        return res
    }
}
