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
 Append each root to leaf paths separated by "->" to the output.

 # Approach
 Perform preorder DFS traversal.
 Store the path as a string separated by "->".
 Return an array of root-leaf-paths.

 # Complexity
 - Time complexity:
 O(n) where `n` is `root.nodes.size`

 - Space complexity:
 O(1) or O(n) where `n` is the depth of the tree.
 */

class Solution {
    func populate(_ root: TreeNode?, _ path: String, _ ans: inout [String]) {
        guard let root = root else {
            return
        }
        
        if root.left == nil && root.right == nil {
            ans.append(path + (path.isEmpty ? "" : "->") + String(root.val))
        }
        
        populate(root.left, path + (path.isEmpty ? "" : "->") + String(root.val), &ans)
        populate(root.right, path + (path.isEmpty ? "" : "->") + String(root.val), &ans)
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res = [String]()
        populate(root, "", &res)
        return res
    }
}
