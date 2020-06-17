import UIKit

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Iterate through the number array, storing the difference
        // (target - nums[i]). If some number in the array matches one of the
        // differences stored in the dictionary, the answer is the number
        // pertaining to the difference and the current number.
        
        var diff = [Int: Int]();
        var answer = [Int]();
        
        for (i, n) in nums.enumerated() {
             
            if let val = diff[n] {
                answer += [val, i];
            }
            
            let result = target - n;
            diff[result] = i;
        }
        
        return answer;
    }
}

let arr = [Int]([1, 3, 5, 9]);
let targ = 12;

let someSolution = Solution();

print(someSolution.twoSum(arr, targ));
