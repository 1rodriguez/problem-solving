class Solution {
    func climbStairs(_ n: Int) -> Int {
        /// Implementing via DP bottom-up approach (tabulation)
        /// Linear time, space
        var tab = [0]
       
        for num in 1...n {
            if num == 1 {
                tab.append(1) // Base case, 1 steps
            } else if num == 2 {
                tab.append(2) // Base case, 2 steps
            } else {
                tab.append(tab[num - 1] + tab[num - 2])
            }
        }
        return tab.removeLast()
    }
}

let someSolution = Solution()

print(someSolution.climbStairs(5))
