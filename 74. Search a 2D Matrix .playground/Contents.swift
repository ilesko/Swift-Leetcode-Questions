import UIKit
import XCTest

/**
 # Intuition
 Use binary search algo to find if `target` exists in `matrix`.
 Find a way to convet a index value between `0...n*m` to a coordinate.
 
 # Approach
 Determine the size of the matrix (s) by multiplying the # of rows by the number of columns.
 Define a helper function that converts a `0...s` value to a 2D coordinate value using division and the modulo operator.
 Use the binary search algo to update the left, right, and mid indices.

 # Complexity
 - Time complexity:
 O(log n * m) where `n` is `matrix.count` and `m` is `matrix[0].count`

 - Space complexity:
 O(1) Only a few integer values are stored.
 */

class Solution {
    /// Convert a single Int value to 2d coordinate
    /// based on the # of columns in the 2d array.
    func convert(_ n: Int, _ c: Int) -> (Int, Int) {
        let x = n == 0 ? 0 : n / c
        let y = n % c
        return (x, y)
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count, cols = matrix[0].count, length = rows * cols
        var l = 0, r = length - 1
        
        while l <= r {
            let mid = (l + r) / 2
            let coord = convert(mid, cols)
            
            if matrix[coord.0][coord.1] == target {
                return true
            }
            
            if matrix[coord.0][coord.1] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        return false
    }
}

class TestCase: XCTestCase {
    func testExamples() {
        let arr = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]
        XCTAssertTrue(Solution().searchMatrix(arr, 3))
        XCTAssertFalse(Solution().searchMatrix(arr, 0))
        XCTAssertTrue(Solution().searchMatrix([[1]], 1))
        XCTAssertFalse(Solution().searchMatrix([[1]], 0))
    }
}
TestCase.defaultTestSuite.run()


