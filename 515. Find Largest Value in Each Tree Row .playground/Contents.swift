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
 Perform max node logic at the start of each row using BFS

 # Approach
 Use BFS traversal to visit each node.
 Store a value to `Int.min` at the beginning of each row so each visited value will at least update row max value.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(n/2 + 1) or O(n)
 */

class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var queue = [root], res = [Int]()
        while !queue.isEmpty {
            var maxVal = Int.min
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                maxVal = max(node.val, maxVal)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            res.append(maxVal)
        }
        
        return res
    }
}
