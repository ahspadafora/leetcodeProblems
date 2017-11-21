//: Playground - noun: a place where people can play

import UIKit

/*
 Prompt: 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].

 */


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // create a dictionary to store the indexes of each number in nums
        var indexesForEachNum: [Int: [Int]] = [:] // [Number: [IndexOfNumberInNumsArray]]
        
        // loop over nums and add each index to indexesOfNumsDict
        for i in 0..<nums.count {
            let currentNum = nums[i]
            if let _ = indexesForEachNum[currentNum] {
                indexesForEachNum[currentNum]!.append(i)
                let intNeededToMakeTarget = target - currentNum
                // check if indexesOfNumsDict has the number needed to make the target & if so return indexes of current number                     and number needed
                if let indexes = indexesForEachNum[intNeededToMakeTarget], let firstIndex = indexes.first {
                    return [i, firstIndex]
                }
            } else {
                indexesForEachNum[currentNum] = [i]
            }
        }
        for (key, value) in indexesForEachNum {
            let intNeededToMakeTarget = target - key
            
            if let indexesOfIntNeeded = indexesForEachNum[intNeededToMakeTarget],
                let firstIndex = value.first,
                let secondIndex = indexesOfIntNeeded.first {
                if firstIndex != secondIndex {
                    return [firstIndex, secondIndex]
                }
            }
        }
        return [0, 0]
    }
}


