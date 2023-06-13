import UIKit

/**
 # Intuition
 Use binary search on the prefix sum of `nums`.
 
 # Approach
 This probably is easier to solve when using the prefix sum of `nums.sorted()`.
 `nums` is sorted so a binary search can be performed.
 From there it is a matter of find each index where `nums[i] <= queries[j]`.
 The left index of the binary search can be treated as the "insert" index.
 An exception is made when the prefix array contains `query`.
 In that case an exception is made since the "number" of subsequences would need to be
 1-indexed instead of 0-indexed.
 
 # Complexity
 - Time complexity:
 O(n log n) where `n` is `prefix.count`
 
 O(n log n)(sort) + O(n)(prefix sum) + O(log n)(binary search) =
 O(2n + 2(log n)) =
 O(n log n)

 - Space complexity:
 O(n) where `n` is `prefix.count`
 */

class Solution {
    func findMaxSubsequence(_ prefix: [Int], _ query: Int) -> Int {
        var l = 0, r = prefix.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if prefix[mid] == query {
                // Accounts for the fact that counts are 1-indexed.
                return mid + 1
            }
            
            if query > prefix[mid] {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        return l
    }
    
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        
        let nums = nums.sorted()
        var prefix = [nums[0]]
        for i in 1..<nums.count {
            prefix.append(prefix[i - 1] + nums[i])
        }
        
        var res = [Int]()
        for query in queries {
            res.append(findMaxSubsequence(prefix, query))
        }
        return res
    }
}
