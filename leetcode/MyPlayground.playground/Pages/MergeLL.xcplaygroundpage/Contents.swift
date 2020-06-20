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
                
                guard head1 != nil else {
                    queue.append(head2!)
                    break
                }
             } else { // In this case, # nodes n1 > # nodes n2, can continue appending n1 as lists are sorted
                 queue.append(head1!)
                 head1 = head1!.next
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


func createLinkedList(_ arr: [Int?]) -> ListNode? {
    /// Generates a linked list an array of integers, where successive array entries are linked
    /// The value of each node is the integer at the respective index
    
    guard !arr.isEmpty else { return nil } // Dealing with an empty array
    
    let head = ListNode(arr[0]!) // Safe to unwrap, entry checked above
    var temp = head
    
    for (idx, entry) in arr.enumerated() {
        if idx == 0 { continue } // getting around initialization issue
        temp.next = ListNode(entry!)
        temp = temp.next! // safe to unwrap as entry is non-nil value, generating a list node
        if idx == arr.count - 1 {
            break
        }
    }
    
    return head
}

func printLinkedList(_ node: ListNode?) {
    /// Generates an array for printing from a linked list
    
    var head = node
    var arr = [Int]()
    
    repeat {
        arr.append(head!.val)
        if head?.next != nil {
            head = head!.next  // safe to unwrap in here
        } else if head?.next == nil {
            break
        }
    } while head?.val != nil
    
    print(arr)
}

func test (_ arr1 : [Int], _ arr2 : [Int]) {
    let a = createLinkedList(arr1)
    let b = createLinkedList(arr2)
    
    let someSolution = Solution()
    printLinkedList(someSolution.mergeTwoLists(a,b))
}


test([], [1,2,3]) // FIXME: Array in position B can't be longer than array in position A
