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
 Use the normal BFS traversal and reverse each odd row

 # Approach
 Iterate using standard BFS traversal.
 Create an array of values for each row.
 Reverse the row if it is an odd row.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(n/2 + 1) or O(n)
 */

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var queue = [root], res = [[Int]]()
        var isEven = true
        while !queue.isEmpty {
            var acc = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                acc.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            res.append(isEven ? acc : acc.reversed())
            isEven = !isEven
        }
        
        return res
    }
}
