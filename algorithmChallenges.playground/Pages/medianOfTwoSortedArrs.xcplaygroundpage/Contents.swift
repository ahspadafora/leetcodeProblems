//: [Previous](@previous)

import Foundation

/*
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // perform merge sort
        let mergedArr = mergeSort(nums1, nums2)
        if mergedArr.count % 2 == 0 {
            var i: Double = Double(mergedArr[mergedArr.count/2])
            var j: Double = Double(mergedArr[(mergedArr.count/2) - 1])
            return ((i + j)/2)
        } else {
            return Double(mergedArr[mergedArr.count/2])
        }
    }
    
    func mergeSort(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var lpointer = 0
        var rpointer = 0
        var orderedPile: [Int] = []
        while lpointer < nums1.count && rpointer < nums2.count {
            if nums1[lpointer] < nums2[rpointer] {
                orderedPile.append(nums1[lpointer])
                lpointer += 1
            } else if nums1[lpointer] > nums2[rpointer] {
                orderedPile.append(nums2[rpointer])
                rpointer += 1
            } else {
                orderedPile.append(nums1[lpointer])
                orderedPile.append(nums2[rpointer])
                lpointer += 1
                rpointer += 1
            }
        }
        while lpointer < nums1.count {
            orderedPile.append(nums1[lpointer])
            lpointer += 1
        }
        while rpointer < nums2.count {
            orderedPile.append(nums2[rpointer])
            rpointer += 1
        }
        return orderedPile
    }
}
