// 121. Best Time to Buy and Sell Stock
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var largestDiff : Int = 0
        var highest : Int? = nil
        
        let backPrices = prices.reversed()
        
        for num in backPrices {
            if highest == nil {
                highest = num
                continue
            }
            
            if num > highest! { // Safe to unwrap, highest has already been assigned a value
                highest = num
            } else if num < highest! && highest! - num > largestDiff {
                largestDiff = highest! - num
            }
        }
        return largestDiff
    }
}

let example = [7,6,4,3,1]

let someSolution = Solution()

print(someSolution.maxProfit(example))
