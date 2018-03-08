// Array<Int> == [Int]

class Solution {
    func PredictTheWinner(_ arr: Array<Int>) -> Bool {
        let result = calculateBestScore(arr)
        return result >= 0
    }

    func calculateBestScore(_ arr: [Int]) -> Int {
        guard arr.count > 0 else { return 0 }
        let (result, nums) = oneRoundGame(arr)
        return result + calculateBestScore(nums)
    }

    func oneRoundGame(_ arr: [Int]) -> (Int, [Int]) {
        guard arr.count >= 2 else { return (arr[0], []) }

        var nums = arr
        let valueForA = nums.remove(at: pickBestScoreIndex(nums))
        let valueForB = nums.remove(at: pickBestScoreIndex(nums))
        print(valueForA)
        return (valueForA - valueForB, nums)
    }

    func pickBestScoreIndex(_ arr: [Int]) -> Int {
        guard arr.count != 0 else { return -1 }
        if arr.count == 1 {
            return 0 // return the only one
        } else if arr.count == 2 {
            return arr.first! > arr.last! ? 0 : 1 // get the bigger one
        }

        let head2 = arr[0...1]
        let tail2 = arr[arr.count - 2...arr.count-1]

        let a = head2.first!
        let b = head2.last!
        let c = tail2.first!
        let d = tail2.last!

        if (a - b) >= (d - c) {
            return 0
        } else {
            return arr.count - 1
        }
    }
}
//print(Solution().PredictTheWinner([1, 5, 233, 7]))
print(Solution().PredictTheWinner([1, 5, 8, 4]))
//print(Solution().PredictTheWinner([1,567,1,1]))
//print(Solution().PredictTheWinner([0]))
//print(Solution().PredictTheWinner([1000,999,999,1000,555,400]))

// let arr = [3606449,6,5,9,452429,7,9580316,9857582,8514433,9,6,6614512,753594,5474165,4,2697293,8,7,1]
// print(Solution().PredictTheWinner(arr))
