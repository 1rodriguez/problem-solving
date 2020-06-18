/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? { // TODO: -> ListNode?
        while l1?.val != nil && l2?.val != nil {
            let aVal : Int! = l1?.val
            let bVal : Int! = l1?.val
            
            if bVal > aVal {
                l2!.next = l1!.next
                l1!.next = l2
            } else {
                mergeTwoLists(l1!.next, l2!.next)
                l2!.next = l1
            }
        }
        return l1
    }
}

let first = ListNode(1, nil);
let second = ListNode(3, nil);
let third = ListNode(4, nil);
first.next = second
second.next = third

let firstA = ListNode(1, nil);
let secondA = ListNode(2, nil);
let thirdA = ListNode(4, nil);
firstA.next = secondA
secondA.next = thirdA

let someSolution = Solution();

print(someSolution.mergeTwoLists(first, firstA));
