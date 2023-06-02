import UIKit

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: Node?, _ right: Node?, _ next: Node?) {
        self.val = val
        self.left = left
        self.right = right
        self.next = next
    }
}

/**
 # Intuition
 Store a reference to the previous visited node in a BFS traversal

 # Approach
 Use BFS traversal to visit each node.
 Set `previous` to nil at the beginning of each level.
 Set `current.next` to `previous`.
 Set `previous` to `current`.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(n/2 + 1) or O(n)
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        
        var queue = [root]
        while !queue.isEmpty {
            var prev: Node?
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                prev?.next = node
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
                
                prev = node
            }
        }
        
        return root
    }
}
