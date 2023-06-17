import UIKit

/**
 # Intuition
 Find the index, or pivot point, where the array is shifted.
 Split the array into two separate arrays and perform binary
 search on both arrays.  The answer is guaranteed to be in either one
 of the halves or neither of the halves.
 
 # Approach
 Use the `findPivot` function to find the index where `nums` is shifted.
 If the pivot index is 0 (nums is not shifted), we can simply perform
 a normal binary search on `nums`.
 Otherwise, perform a binary search on the two halves,
 `nums[0..<pivot]` and `nums[pivot..<nums.count]`.
 No index shifting is required for the left half.
 Shift the binary search index on the right half by `pivot`, if target
 is in the right half.

 # Complexity
 - Time complexity:
 O(n log n) where n is `nums.count`
 O(log n)(binary search) + O(n)(array slice)

 - Space complexity:
 O(n) where n is `nums.count`
 */

class Solution {
    func findPivot(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            let mid = (l + r) / 2
            if nums[mid] > nums[r] {
                l = mid + 1
            } else {
                r = mid
            }
        }

        return l
    }

    func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target {
                return mid
            }

            if target > nums[mid] {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return -1
    }

    func search(_ nums: [Int], _ target: Int) -> Int {
        let pivot = findPivot(nums)
        guard pivot > 0 else {
            return binarySearch(nums, target)
        }
        let lAns = binarySearch(Array(nums[0..<pivot]), target)
        var rAns = binarySearch(Array(nums[pivot..<nums.count]), target)
        rAns = rAns == -1 ? rAns : rAns + pivot
        return max(lAns, rAns)
    }
}

