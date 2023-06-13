import UIKit

/**
 # Intuition
 Use binary search algo to find the insert index.
 
 # Approach
 Return the mid index when `nums` contains `target`.
 
 Return the left index when `nums` does not contain `target`.
 When the left index becomes greater than the right index
 we know that the binary search was unsuccessful and the insert
 must happen at the last `mid` index + 1.

 # Complexity
 - Time complexity:
 O(log n) where n is `nums.count`

 - Space complexity:
 O(1)
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        return l
    }
}


var arr = [1,3,4]
let sol1 = Solution().searchInsert(arr, 2) // 2
let sol2 = Solution().searchInsert(arr, 5) // 2
