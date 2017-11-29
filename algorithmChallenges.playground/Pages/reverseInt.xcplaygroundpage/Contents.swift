//: [Previous](@previous)

import Foundation

/*
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output:  321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        let max = Int32.max
        let min = Int32.min
        var digits = Array(String(x).characters)
        var reversed = Array(digits.reversed()).map{String($0)}.joined(separator: "")
        
        if x < 0 {
            reversed.removeLast()
            guard let num = Int(reversed) else { return 0 }
            if (num > max || num < min) { return 0 }
            return num * -1
        }
        guard let num = Int(reversed) else { return 0 }
        if (num > max || num < min) { return 0 }
        return num
    }
}
Solution().reverse(321)
