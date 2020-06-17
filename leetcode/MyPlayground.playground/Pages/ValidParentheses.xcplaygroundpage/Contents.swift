//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
class Solution {
    
    func isValid(_ s: String) -> Bool { // TODO: -> Bool
        let ref : [Character:Character] = ["(" : ")", "{" : "}", "[" : "]"]; // Holds open/close pairs
        
        var input = Array(s); // Mutability required to pop-out valid substrings
        var i = 0;
        
        if input.count % 2 == 1 { return false }
        
        while i < input.count {
            let char = input[i];

            if ref[char] ==  nil { // Expected on the first instance of a closing bracket, keys are all opening brackets
                if ref[input[i - 1]] == char {
                    input.remove(at: i - 1);
                    input.remove(at: i - 1);
                    i = 0; // reset process
                } else if input.count == 0 { // array empty, can break and return true
                    return true;
                } else { return false } // No closing bracket found
                
            } else {i += 1}
        }
        return input.count == 0;
    }
}

let testString = "()";

let someSolution = Solution();
print(someSolution.isValid(testString));
