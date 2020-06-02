# P01: Two Sum
# difficulty: E
"""
Given an array of integers, return indices of the two numbers such that they
add up to a specific target.

You may assume that each input would have exactly one solution, and you may not
use the same element twice.
"""


class Solution:
    def twoSum(self, nums: [int], target: int) -> [int]:
        result = []
        record = {}

        for i in range(len(nums)):
            current = nums[i]
            diff = target - current

            if (current in record):  # current entry = required difference
                # append the number that generated the required difference
                result.append(record[current])
                # append required difference
                result.append(i)

            record[diff] = i
            # record should be updated after checking if current entry in
            # record to avoid issues where 2*n = target (n is some entry in
            # nums

        return result

# time complexity: O(n)
# space complexity: O(n)
