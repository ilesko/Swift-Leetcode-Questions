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
    
    func printNodes(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        var queue = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            print(node.val, queue.isEmpty ? node.val : -1)
            
            if let left = node.left {
                queue.append(left)
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        printNodes(root)
        guard let root = root else {
            return 0
        }
        
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
