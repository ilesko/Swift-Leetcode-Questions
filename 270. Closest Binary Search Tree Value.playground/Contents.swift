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
  Traverse along a path in a binary search tree where `root.val` is closest to `target`.

  # Approach
  Use BST traversal to path along the values that are closest to `target`.
  Store the minimum delta between `root.val` and `target`.
  Store the smallest visited node value.
  
  Update the smallest visited node when the current delta is less than the minimum delta.
  Update the smallest visited node when the current delta is equal to the current delta.  Use the `min()` of these two nodes.

  # Complexity
  - Time complexity:
  O(log n) where `n` is `root.nodes.size`
  O(n) worst case when the tree is unbalanced (like a one sided linked list)

  - Space complexity:
  O(1) or O(h) where `h` is the height of the call stack

 Take this tree for example:
 ```
 Target: 7.5

          9
        /   \
     4       10
    / \      / \
   3    7   11  12
  /    / \
 1    6   8

 ```

 The traversal path will be `9 -> 4 -> 7 -> 8`

 9's right subtree can be ignored since 9 > 7.5 and any of the values in the right subtree will always be greater than 9.

 7 and 8 will both be valid answer after following the BST traversal path. We can store the lowest node value since both of the deltas are equal (0.5).
 */

class Solution {
    var minDelta = Double(Int.max)
    var ans = Int.max
    
    func evaluate(_ root: TreeNode?, _ target: Double) {
        guard let root = root else {
            return
        }
        
        let delta = abs(target - Double(root.val))
        if delta < minDelta {
            minDelta = delta
            ans = root.val
        } else if delta == minDelta {
            ans = min(ans, root.val)
        }
        
        if target < Double(root.val) {
            evaluate(root.left, target)
        } else {
            evaluate(root.right, target)
        }
    }
    
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        evaluate(root, target)
        return ans
    }
}
