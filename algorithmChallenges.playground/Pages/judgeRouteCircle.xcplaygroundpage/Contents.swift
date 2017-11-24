//: [Previous](@previous)

import Foundation

/*
 Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.
 
 The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.
 
 Example 1:
 Input: "UD"
 Output: true
 Example 2:
 Input: "LL"
 Output: false
 */

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        let movesArr = Array(moves)
        if movesArr.count % 2 == 1 { return false }
        
        var moveCounts: [Character: Int] = [:]
        for i in 0..<movesArr.count {
            if let _ = moveCounts[movesArr[i]] {
                moveCounts[movesArr[i]]! += 1
            } else {
                moveCounts[movesArr[i]] = 1
            }
        }
        let lCount = moveCounts["L"] ?? 0
        let rCount = moveCounts["R"] ?? 0
        let uCount = moveCounts["U"] ?? 0
        let dCount = moveCounts["D"] ?? 0
        
        return (lCount == rCount) && (dCount == uCount)
    }
}
