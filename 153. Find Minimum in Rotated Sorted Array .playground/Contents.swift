import UIKit

/**
 # Intuition
 Use binary search to find the first index where `nums[i] > nums[i+1]`.
 
 # Approach
 If we know our left, right, and mid indices during a binary search, we know that the answer will be to the right of the mid point if `nums[mid] > nums[r]`
 
 Example:
 ```
  l   m     r
 [4,5,6,1,2,3]
 
 // In a non-rotated ascending sorted array, nums[r] would be greater than nums[mid]
 // so the answer would be to the right of mid.
 ```
 
 When `nums[mid] < nums[r]`, we need to keep search to the left of `mid` to find the smallest value.  We only perform search when the left index is less than the right index because we don't want the left index to cross the right index.
 
 
 Example:
 ```
  l   m     r
 [4,5,6,1,2,3]
 // nums[mid] > nums[r], search to the right
 
       l m r
[4,5,6,1,2,3]
 // nums[mid] < nums[r], search to the left
 
       m
       l r
[4,5,6,1,2,3]
 // nums[mid] < nums[r], search to the left
 
       r
       l
[4,5,6,1,2,3]
 // l is no longer < r, return l
 
 ```

 # Complexity
 - Time complexity:
 O(log n) where n is `nums.count`

 - Space complexity:
 O(1)
 */

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let mid = (l + r) / 2
            if nums[mid] > nums[r] {
                l = mid + 1
            } else {
                r = mid
            }
        }

        return nums[l]
    }
}
