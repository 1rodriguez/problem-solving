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
    func mergeTwoLists(_ n1: ListNode?, _ n2: ListNode?) -> ListNode? {
        var queue = [ListNode]()
        // By limiting the array to append/removeFirst operations, it behaves as a queue (FIFO)
        // Runtime: O(n); Space: O(n)
        
        if n1 == nil && n2 == nil { return nil }
        else if n1 == nil {
            return n2
        } else if n2 == nil {
            return n1
        }
        
        var head1 : ListNode? = n1
        var head2 : ListNode? = n2
        // Keep track of current head of both queues
        
        var result : ListNode? // Null on first iteration
        
        while let value1 = head1?.val {
            // Guaranteed to have a non-nil node in list 1 within this block due to n1 value check
            // Therefore, can force unwrap within the block safely
            
            if let value2 = head2?.val {
                if value1 < value2 {
                    queue.append(head1!) // Force-unwrap is fine here, see above comment
                    head1 = head1!.next // Reassigning head node
                } else {
                    queue.append(head2!)
                    head2 = head2!.next
                }
            } else { // In this case, # nodes n1 > # nodes n2, can continue appending n1 as lists are sorted
                queue.append(head1!)
                head1 = head1!.next
            }
            for entry in queue {
                print(entry.val)
            }
            
        }
        result = queue.removeFirst()
        var headRes : ListNode = result!
        
        for entry in queue { // Stitching the list back together
            headRes.next = entry
            headRes = entry
        }
        
        return result
    }
}


let someSolution = Solution()

let node1 = ListNode(1)
//let node2 = ListNode(2)
//let node3 = ListNode(4)
//node1.next = node2
//node2.next = node3

let nodeA = ListNode(2)
//let nodeB = ListNode(3)
//let nodeC = ListNode(4)
//nodeA.next = nodeB
//nodeB.next = nodeC

var result = someSolution.mergeTwoLists(node1, nodeA)


