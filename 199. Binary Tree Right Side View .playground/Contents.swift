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
 Return the right most node from each level of the tree.

 # Approach
 Use BFS to store an array of integers.
 Append the last node in each row to the result.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(n) where `n` is the size of the last row
 */

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var queue = [root], res = [Int]()
        while !queue.isEmpty {
            let levelSize = queue.count
            for i in 0..<levelSize {
                let node = queue.removeFirst()
                
                if i == levelSize - 1 {
                    res.append(node.val)
                }
                
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
