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
 Toggle the BFS visit direction every other row

 # Approach
 Use BFS traversal to visit each node.
 Store a flag that toggle at the end of each row.
 Even rows populate the queue from the node's children L -> R.
 Odd rows populate the queue from the node's children R -> L.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(n/2 + 1) or O(n)
 
 # Note
 This solution aims to avoid calling .reversed() on the values of even rows to increase performance.
 
 The verbose solution is faster (5ms) and is easier to read IMO.
 The concise solution is slower (11ms) and is harder to read.  The performance hit may come from the ternary operator?
 */

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var res = [[Int]](), queue = [root], isEven = true
        while !queue.isEmpty {
            var temp = [Int]()
            for _ in 0..<queue.count {
                if isEven {
                    let node = queue.removeFirst()
                    temp.append(node.val)
                    
                    if let left = node.left {
                        queue.append(left)
                    }
                    
                    if let right = node.right {
                        queue.append(right)
                    }
                } else {
                    let node = queue.removeLast()
                    temp.append(node.val)
                    
                    if let right = node.right {
                        queue.insert(right, at: 0)
                    }
                    
                    if let left = node.left {
                        queue.insert(left, at: 0)
                    }
                }
            }
            
            res.append(temp)
            isEven = !isEven
        }

        
        return res
    }
}

/*
/// Concise solution
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var res = [[Int]](), queue = [root], isEven = true
        while !queue.isEmpty {
            var temp = [Int]()
            for _ in 0..<queue.count {
                let node = isEven ? queue.removeFirst() : queue.removeLast()
                temp.append(node.val)
                
                if let a = isEven ? node.left : node.right {
                    isEven ? queue.append(a) : queue.insert(a, at: 0)
                }
                
                if let b = isEven ? node.right : node.left {
                    isEven ? queue.append(b) : queue.insert(b, at: 0)
                }
            }
            
            res.append(temp)
            isEven = !isEven
        }

        return res
    }
}
*/
