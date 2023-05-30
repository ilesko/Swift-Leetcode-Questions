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
 Use a map to store the frequency of subtree sum values using DFS postorder traversal.

 # Approach
 Use postorder DFS to traverse the tree.
 Use a map to store the frequency of `root.val` + the sum of its left and right subtrees.
 `maxSum` keeps track of the highest sum frequency so we don't have to iterate over map's values once the traversal is complete.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(n) where `n` is the depth of the tree AND/OR `n` is the number of unique sums.
 */

class Solution {
    var map: [Int: Int] = [:]
    
    func populate(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        let l = populate(root.left, &maxSum)
        let r = populate(root.right, &maxSum)
        
        let sum = l + r + root.val
        map[sum] = map[sum, default: 0] + 1
        maxSum = max(maxSum, map[sum]!)
        return sum
    }
    
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        var maxSum = 0
        populate(root, &maxSum)
        return map.keys.filter({ map[$0] == maxSum })
    }
}
