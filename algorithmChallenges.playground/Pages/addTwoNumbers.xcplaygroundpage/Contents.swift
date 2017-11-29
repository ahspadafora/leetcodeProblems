//: [Previous](@previous)

import Foundation


/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */


  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
        self.val = val
        self.next = nil
      }
  }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var newListNode: ListNode?
        var currentPointer: ListNode?
        var carryOver: Int = 0
        
        guard var leftNode = l1, var rightNode = l2 else { return nil }
        let i = leftNode.val
        let j = rightNode.val
        if i + j < 10 {
            newListNode = ListNode(i + j)
            currentPointer = newListNode
        } else {
            carryOver = 1
            newListNode = ListNode((i + j) % 10)
            currentPointer = newListNode
        }
        while (leftNode.next != nil && rightNode.next != nil ) {
            leftNode = leftNode.next!
            rightNode = rightNode.next!
            let i = leftNode.val
            let j = rightNode.val
            if i + j + carryOver < 10  {
                currentPointer!.next = ListNode(i + j + carryOver)
                currentPointer = currentPointer!.next
                carryOver = 0
            } else {
                let val = (i + j + carryOver) % 10
                currentPointer!.next = ListNode(val)
                currentPointer = currentPointer!.next
                carryOver = 1
            }
        }
        while leftNode.next != nil && rightNode.next == nil {
            leftNode = leftNode.next!
            if leftNode.val + carryOver < 10 {
                currentPointer!.next = ListNode(leftNode.val + carryOver)
                carryOver = 0
            } else {
                currentPointer!.next = ListNode((leftNode.val + carryOver)%10)
                carryOver = 1
            }
            currentPointer = currentPointer!.next
        }
        while rightNode.next != nil && leftNode.next == nil {
            rightNode = rightNode.next!
            if rightNode.val + carryOver < 10 {
                currentPointer!.next = ListNode(rightNode.val + carryOver)
                carryOver = 0
            } else {
                currentPointer!.next = ListNode((rightNode.val + carryOver)%10)
                carryOver = 1
            }
            currentPointer = currentPointer!.next
        }
        if carryOver == 1 {
            currentPointer!.next = ListNode(carryOver)
        }
        return newListNode
    }
}
