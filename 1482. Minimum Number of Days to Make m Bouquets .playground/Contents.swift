import UIKit

/*
 # Intuition
 Define a solution space and use binary search to derive the minimum number of days.
 The solution space is `bloomDay.min...bloomDay.max`.
 Use a separate function to determine if a given number of days satisfies
 the conditional logic for the question.
 
 # Complexity
 - Time complexity:
 O(n log n) where `n` is `bloomDay.count`.
 O(n)(find min and max) * O(log n)(binary search) * O(n)(checkDays)
 
 - Space complexity:
 O(1) only a few integers are stored.
 
 This problem is similar to to [875. Koko eating bananas](https://leetcode.com/problems/koko-eating-bananas/)
 */

class Solution {
    /// Checks if a given number of days satisfies the conditional
    func checkDays(_ bloomDay: [Int], _ m: Int, _ k: Int, _ days: Int) -> Bool {
        var bouquets = 0, adjacent = 0
        for flower in bloomDay {
            if flower <= days {
                adjacent += 1
            } else {
                adjacent = 0
            }

            if adjacent == k {
                bouquets += 1
                adjacent = 0
            }

            if bouquets == m {
                return true
            }
        }

        return false
    }

    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        // Define impossible case
        guard bloomDay.count >= m * k else {
            return -1
        }

        // Define solution space
        var l = Int.max, r = Int.min
        for b in bloomDay {
            l = min(l, b)
            r = max(b, r)
        }
        
        // Use binary search to shrink solution space
        while l <= r {
            let mid = (l + r) / 2
            if checkDays(bloomDay, m, k, mid) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }

        return l
    }
}
