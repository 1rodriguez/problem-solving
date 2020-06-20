//Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var currentMax : Int = 0
        var universal = 0
        for (i, entry) in nums.enumerated() {
            if i == 0 {
                currentMax = entry
                universal = currentMax
                continue
            }
            let altered = currentMax + entry
            
            switch max(altered, entry) {
            case altered:
                currentMax = altered
            default:
                currentMax = entry
            }
            
            if universal < currentMax {
                universal = currentMax
            }
        }
        return universal
    }
}

let someSolution = Solution()

var master = [[Int]]()

for _ in 0...10 {
    var array = [Int]()
    for _ in 0...Int.random(in:0...10) {
        array.append(Int.random(in: -10...10))
    }
    master.append(array)
}

for entry in master {
    print(someSolution.maxSubArray(entry))
}
