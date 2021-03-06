import UIKit

let arr = [1,2,3]

func secondLargest(arr: [Int]) -> Int {
    
    var largest = arr.first ?? -1000  // 1
    var secondLargest = arr.first ?? -1000  // 1
    
    for num in arr {
        if num > largest {
            secondLargest = largest
            largest = num
        } else if num > secondLargest {
            secondLargest = num
        }
    }
    
    return secondLargest
}

secondLargest(arr: arr)

func patternMatch(sentence: String, pattern: String) -> Bool {
    
    let array = sentence.components(separatedBy: " ")
    let patternArray = Array(pattern)
    var freqDict = [Character: String]()
    
    for index in 0..<patternArray.count {  // [e,f,e]
        let word = patternArray[index] // [e,f,e]
        if freqDict[word] == nil {
            freqDict[word] = array[index] // [e: apple]
        } else {
            if freqDict[word] != array[index] { //
                print("false")
                return false
            }
        }
    }
    return true
}

patternMatch(sentence: "apple banana apple banana", pattern: "xcxc")

func getDiagonal(matrix: [[Int]]) -> Int {
    var sum = 0
    var otherSum = 0
    
    let count = matrix.count
    
    for index in 0..<count {
        sum += matrix[index][index]
        otherSum += matrix[index][count - index - 1]
    }
    
    return sum + otherSum
}
getDiagonal(matrix: [[1,2,9], [8,2,3], [4,5,6]])

func firstFiveEvenSums(arr: [Int]) -> Int {
    var evenArr = [Int]()
    
    evenArr = arr.filter {$0 % 2 == 0}
    
    var sum = 0
    
    for num in Array(evenArr[0...4]) {
        sum += num
    }
    
    return sum
}

firstFiveEvenSums(arr: [3,7,-3,2,9,4,8,10,3,9,4,9,8,6,-2])

func largestTwoMultiples(arr: [Int]) -> Int {
    
    var first = arr.first ?? 0
    var second = arr.first ?? 0
    
    for num in arr {
        if num > first {
            second = first
            first = num
        } else if num > second {
            second = num
        }
    }
    
    return first * second
    
}

largestTwoMultiples(arr: [1, 2, 7, 3, 9, 5])


var digitSet = Set<Int>()
var result = true

func isHappy(_ n: Int) -> Bool {
    var digitArray = [Int]()
    
    var sum = 0
    
    var totalSum = 0
    
    for digit in n.description {
        digitArray.append(digit.wholeNumberValue ?? 1000)
    }
    
    print()
    print(digitArray)
    
    for digit in digitArray {
        sum += digit * digit
    }
    
    totalSum = sum
    print("total sum \(totalSum)")
    
    if digitSet.contains(totalSum) {
        print("does contain \(totalSum)")
        print("false")
        result = false
    } else {
        guard totalSum != 1 else {return true}
        digitSet.insert(totalSum)
        print("doesn't contain \(totalSum)")
        isHappy(totalSum)
    }
    
    return result
}

isHappy(2)

func maxSubArray(arr: [Int]) -> Int {
    
    guard arr.count >= 2 else {return arr.first ?? -10000}
    
    var currentMax = arr[0]
    var globalMax = arr[0]
    
    for index in 1..<arr.count {
        currentMax = max(arr[index], currentMax + arr[index])
        
        if currentMax > globalMax {
            globalMax = currentMax
        }
    }
    return globalMax
}

maxSubArray(arr: [-2,1])

func moveZeros(nums: inout [Int]) {
    
    var j = 0
    
    for index in 0..<nums.count {
        if nums[index] != 0 {
            let previous = nums[j]
            nums.swapAt(j, index)
            nums[index] = previous
            j += 1
        }
    }
}

var zeroArr = [0,1,0,3,12]
moveZeros(nums: &zeroArr)


func maxProfit(arr: [Int]) -> Int {
    var maxProfit = 0
    
    for index in 1..<arr.count {
        let temp = arr[index - 1]
        if temp > arr[index] {
            maxProfit += arr[index] - temp
        }
    }
    return maxProfit
}

var allSum = 0
func repeatAdd(num: Int) -> Int {
    
    var digitArray = [Int]()
    
    for digit in num.description {
        digitArray.append(digit.wholeNumberValue ?? 1000)
    }
    print(digitArray)
    
    allSum = digitArray.reduce(0, +) // 19
    print("original: \(allSum)")
    
    if allSum >= 10 {
        print("new \(allSum)")
        repeatAdd(num: allSum)
    }
    
    if allSum < 10 {
        print("the answer is \(allSum)")
    }
    
    return allSum
}

repeatAdd(num: 5419)


func countElements(_ arr: [Int]) -> Int {
    guard !arr.isEmpty else {return 0}
    
    var answer = 0
    
    for num in arr {
        if arr.contains(num) && arr.contains(num + 1) {
            answer += 1
        }
    }
    
    return answer
}

countElements([1,1,2,2])

