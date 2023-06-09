import UIKit

/**
 # Intuition
 Create the result by iterating over the digits of `x` in reverse order.

 # Approach
 Get the last digit of `x` using the modulo operator.
 Multiply the result by 10 to shift each digit to the left.
 Add the remainder from step 1.
 Divide `x` by 10 to remove the last digit.
 
 # Complexity
 - Time complexity:
 O(n) where `n` is the number of digits in `x`.

 - Space complexity:
 O(1) for the iterative solution
 O(h) for the recursive solution where h is the height of the call stack.
 */

// Iterative solution
class IterativeSolution {
    func reverse(_ x: Int) -> Int {
        let signed = x > 0
        var x = abs(x), res = 0
        while x != 0 {
            res *= 10
            res += x % 10
            x /= 10
        }

        return res > Int32.max ? 0 : (signed ? res : -res)
    }
}

// Recursive solution
class RecursiveSolution {
    func reversed(_ x: inout Int) -> Int {
        guard x != 0 else {
            return x
        }
        
        let rem = x % 10
        x /= 10
        return (reversed(&x) * 10) + rem
    }
    
    func reverse(_ x: Int) -> Int {
        let signed = x > 0
        var x = abs(x)
        var res = reversed(&x)

        return res > Int32.max ? 0 : (signed ? res : -res)
    }
}
