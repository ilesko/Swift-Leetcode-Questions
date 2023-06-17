import UIKit

class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var maxDist = 0
        for i in 0..<nums1.count {
            var l = i, r = nums2.count - 1
            while l <= r {
                let mid = (l + r) / 2
                if nums2[mid] >= nums1[i] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            maxDist = max(maxDist, r - i)
        }

        return maxDist
    }
}
