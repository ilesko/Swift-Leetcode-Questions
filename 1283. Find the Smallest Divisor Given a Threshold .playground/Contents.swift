import UIKit

/*
 # Intuition
 Define a solution space to perform a binary search to find the min # of banans.
 
 # Approach
 Define a range of possible values.  We know that the mininum possible value
 is 1 since dividing a number by 0 won't accumulate the sum.  The maximum possible
 value is `max(nums)` since any greater than the max will always result in 1.
 Use binary search to half the possible range of answer on each iteration.
 The sum of values increases as the divisor decreases and
 the sum of values decreases as the divisor increases.
 
 Continue reducing the binary search space until it cannot be reduced further.
 
 # Complexity
 - Time complexity:
 O(n log k)
 O(n)(check) * O(log k)(binary search where `k` = `nums.max`)
 
 - Space complexity:
 O(1) only a few integers are stored.
 
 This problem is very similar to Koko eating bananas: https://leetcode.com/problems/koko-eating-bananas/
 */

class Solution {
    func check(_ nums: [Int], _ threshold: Int, _ divisor: Int) -> Bool {
        var sum = 0
        for num in nums {
            sum += Int(ceil(Double(num) / Double(divisor)))
            if sum > threshold {
                return false
            }
        }

        return sum <= threshold
    }

    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var l = 1, r = Int.min
        for num in nums {
            r = max(num, r)
        }

        while l <= r {
            let mid = (l + r) / 2
            if check(nums, threshold, mid) {
                // sum <= threshold. Decrease divisor to increase sum.
                r = mid - 1
            } else {
                // sum > threshold.  Increase divisor to decrease sum.
                l = mid + 1
            }
        }

        return l
    }
}

let res1 = Solution().smallestDivisor([1,2,5,9], 6) // 5
let res2 = Solution().smallestDivisor([44,22,33,11,1], 5) // 44
