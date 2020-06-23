class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Iterate through the number array, storing the difference
        // (target - nums[i]). If some number in the array matches one of the
        // differences stored in the dictionary, the answer is the number
        // pertaining to the difference and the current number.
        
        var diff = [Int: Int]()
        
        for (i, n) in nums.enumerated() {
             
            if diff[n] != nil {
                return [diff[n]!, i]
            }
            
            diff[target - n] = i;
        }
        
        return [0]
    }
}

let mySolution = Solution()

let arr = [Int]([1, 3, 5, 9]);
let t = 12;

print(mySolution.twoSum(arr, t));
