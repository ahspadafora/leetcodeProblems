//: [Previous](@previous)

import Foundation

/*
 Steve has a string, s, consisting of n lowercase English alphabetic letters. In one operation, he can delete any pair of adjacent letters with same value. For example, string "aabcc" would become either "aab" or "bcc" after operation.
 
 Steve wants to reduce s as much as possible. To do this, he will repeat the above operation as many times as it can be performed. Help Steve out by finding and printing 's non-reducible form!
 
 Note: If the final string is empty, print Empty String .
 
 Input Format
 A single string, s.
 
 Constraints
 1 <= n <= 100
 
 Output Format
 If the final string is empty, print Empty String; otherwise, print the final non-reducible string.
 
 Sample Input:
 aaabccddd
 Sample Output:
 abd
 
 */

var inputString = Array(readLine()!)

func getNewString(_ input: [Character]) -> String {
    var lpointer = 0
    var rpointer = 1
    var output = input
    if output.count == 0 || output.count == 1 {
        return String(output)
    }
    
    while rpointer < output.count {
        if output[lpointer] == output[rpointer] {
            output.remove(at: rpointer)
            output.remove(at: lpointer)
            lpointer = 0
            rpointer = 1
        } else {
            lpointer += 1
            rpointer += 1
        }
    }
    if output.isEmpty {
        return "Empty String"
    } else {
        return String(output)
    }
}
print(getNewString(inputString))
