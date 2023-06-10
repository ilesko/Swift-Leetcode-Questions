import UIKit

/**
 # Intuition
 Store a range that represents a subarray of `nums`.  Check if the middle of the range is equal to `target`.  If not, divide the array and repeat.

 # Approach
 Starting with the range `l-r` (`0...nums.count - 1`), find the mid point (`(l + r) / 2)`).
 Return the mid point if `arr[mid] == target`.
 If the mid point is greater than `target`, move the right side of the range to `mid - 1`.
 If the mid point is less than `target`, move the left side of the range to `mid + 1`.
 Repeat the process until `l == r`.
 Return -1 if no valid answer was found.

 # Complexity
 - Time complexity:
 O(log n) where `n` is `nums.count`

 - Space complexity:
 O(1) Only a few integer values are stored.
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] > target {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        
        return -1
    }
}
