import UIKit

var greeting = "Hello, playground"

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */


// Dummy implementation to satisfy compiler
class VersionControl {
    func isBadVersion(_ version: Int) -> Bool{
        return true
    }
}

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1, r = n
        while l < r {
            let mid = (l + r) / 2
            if !isBadVersion(mid) {
                l = mid + 1
            } else {
                r = mid
            }
        }

        return l
    }
}
