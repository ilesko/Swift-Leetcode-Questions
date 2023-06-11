import UIKit

/**
 # Intuition
 Find the first index of `potions.sorted()[i] * spells[i]` is greater than or equal to `success`
 
 # Approach
 Sort the potions array.  This is important to perform the binary search.
 Create a helper binary search function that return the index (`i`) that meets the valid condition `potions.sorted()[i] * spells[i] >= success` for each spell.
 Append `potions.count - i` to result.
 (ex: if `potions.count = 5`, `i = 1`, there are four valid value since every value between `potions[i]` and `potions[potions.count - 1]` will satisfy the condition)

 # Complexity
 - Time complexity:
 O(n log n)(sorting) + O(log n)(binary search) = O(n log n)

 - Space complexity:
 O(n) where n is `spells.count`
 */

class Solution {
    func findFirstValidIndex(_ potions: [Int], _ spell: Int, _ success: Int) -> Int {
        var l = 0, r = potions.count
        while l < r {
            let mid = (l + r) / 2
            if potions[mid] * spell >= success {
                r = mid
            } else {
                l = mid + 1
            }
        }
        
        return l
    }
    
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        var res = [Int]()
        let potions = potions.sorted()
        
        for spell in spells {
            res += [potions.count - findFirstValidIndex(potions, spell, success)]
        }
        
        return res
    }
}
