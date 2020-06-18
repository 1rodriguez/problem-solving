//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
class Solution {
    
    let ref : [Character:Character] = ["(" : ")", "{" : "}", "[" : "]"]; // Holds open/close pairs
    
    func isValid(_ s: String) -> Bool {
    
        var stack = [Character](); // Append-pop only, array behaves as stack
        
        if s.count % 2 == 1 { return false; }

        for (_, char) in s.enumerated() {
            if self.ref[char] != nil { // If opening parenthesis
                stack.append(char);
            } else if stack.count > 0 && self.ref[stack.removeLast()] == char {
                continue;
            } else {
                return false;
            }
        }
        return stack.count == 0; // Stack should be empty if valid pairs were encountered
    }
}

let testString = "{}][()";

let someSolution = Solution();
print(someSolution.isValid(testString));
