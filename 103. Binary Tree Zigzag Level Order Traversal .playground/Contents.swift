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

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var res = [[Int]](), queue = [root], isEven = true, acc = [root.val]
        while !queue.isEmpty {
            acc = []
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                acc.append(node.val)
                
                if let left = node.left {
                    queue.insert(left, at: isEven ? 0 : queue.count)
                }
                
                if let right = node.right {
                    queue.insert(right, at: isEven ? 0 : queue.count)
                }
            }
            res.append(acc)
            isEven = !isEven
        }
        
        return res
    }
}
