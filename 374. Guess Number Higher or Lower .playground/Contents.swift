import UIKit

/**
 Dummy implementation to satisfy the compiler.
 */
class GuessGame {
    func guess(_ num: Int) -> Int {
        return -1
    }
}

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var l = 1, r = n
        while l <= r {
            let mid = (l + r) / 2
            switch guess(mid) {
                case 0:
                    return mid
                case 1:
                    l = mid + 1
                default:
                    r = mid - 1
            }
        }

        return l
    }
}
