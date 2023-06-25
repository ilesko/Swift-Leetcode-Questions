import UIKit


/*
 # Intuition
 Define a solution space to perform a binary search to find the min # of trips.
 
 # Approach
 Define a solution space of possible values.
 The minimum number of time required is for one bus to make at least one trip.
 The maximum number of time required is for the fastest bus to make at least `fastestBus * totalTrips` number of trips.
 Use a binary search to find the minimum time
 
 # Complexity
 - Time complexity:
 O(n log n) where `n` is `time.count`.
 O(n)(checkTime) * O(log n)(binary search)
 
 - Space complexity:
 O(1) only a few integers are stored.
 
 This problem is almost identical to [875. Koko eating bananas](https://leetcode.com/problems/koko-eating-bananas/)
 */

class Solution {
    func checkTime(_ time: [Int], _ k: Int, _ minTrips: Int) -> Bool {
        var trips = 0
        for t in time {
            trips += k / t
        }

        return trips >= minTrips
    }

    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        // Define the search space with two pointers
        // L is the minimum number of time required for one bus to make at least one trip
        var l = Int.max
        for t in time {
            l = min(l, t)
        }
        // R is the total number of trips the fastest bus will make
        var r = l * totalTrips

        while l <= r {
            let mid = (l + r) / 2
            if checkTime(time, mid, totalTrips) {
                // Total trips for a given time were greater than `totalTrips`.
                // Try less time
                r = mid - 1
            } else {
                // Total trips for a given time were less than `totalTrips`.
                // Try more time
                l = mid + 1
            }
        }

        return l
    }
}
