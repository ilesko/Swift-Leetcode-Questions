import UIKit

/*
 # Intuition
 Define a solution space to perform a binary search to find the min # of banans.
 
 # Approach
 Define a range of possible values.  We know that the minimum # of banans is 1,
 since 0 would cause no bananas to be eaten.  Any value greater than max(piles) will take
 one hour to eat each pile.
 The check hours function is called on each iteration of the binary search.
 Keep track of how many hours have been spent eating at each pile of bananas.
 
 Example:
 ```
 [3,6,7,11], k = 3, h = 8
 ceil(3/3) + ceil(6/3) + ceil(7/3) + ceil(11/3) = 10 hours
 // invalid answer
 
 [3,6,7,11], k = 4, h = 8
 ceil(3/4) + ceil(6/4) + ceil(7/4) + ceil(11/4) = 8 hours
 // valid answer
 ```
 
 If a `k` value has gone over the time limit we know we need to decrease it and
 vice versa if it is under the time limit.
 
 Continue reducing the binary search space until it cannot be reduced further.
 
 # Complexity
 - Time complexity:
 O(n log k)
 O(n)(checkHours) * O(log k)(binary search where `k` = piles(max))
 
 - Space complexity:
 O(1) only a few integers are stored.
 */

class Solution {
    func checkHours(_ piles: [Int], _ k: Int, _ limit: Int) -> Bool {
        var hours = 0
        for pile in piles {
            hours += Int(ceil(Double(pile) / Double(k)))
            if hours > limit {
                return false
            }
        }
        return hours <= limit
    }
    
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // Define the binary search space,
        // 1...max(piles) in this case.
        var l = 1, r = Int.min
        for pile in piles {
            r = max(r, pile)
        }
        
        while l <= r {
            let mid = (l + r) / 2
            if checkHours(piles, mid, h) {
                // Koko eats too many bananas.
                // Encourage Koko to eat less bananas per hour.
                r = mid - 1
            } else {
                // Koko doesn't eat enough banans.
                // Ask Koko to eat one more banana per hour.
                l = mid + 1
            }
        }
        
        return l
    }
}

let arr = [3,6,7,11]
let ans = Solution().minEatingSpeed(arr, 4)
print(ans)
