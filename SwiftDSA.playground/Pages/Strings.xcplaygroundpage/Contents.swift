import UIKit

func checkingPal(it: String) -> Bool {
    
    var reverseStr = ""
    
    let newIt = it.filter {$0.isLetter} // for loop
    
    for char in newIt.lowercased() {  // for loop
        // "hello"
        reverseStr = String(char) + reverseStr
        // "h" + ""
        // "e" + "h"
    }
    return newIt.lowercased() == reverseStr.lowercased() // if else
}
checkingPal(it: "Madam I'm Adam")

func allAlphabets(it: String) -> Bool {

    let alphabets: Set<Character> = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    var nospace = ""

    for char in it {
        if char.isWhitespace || char.isPunctuation {continue}
        nospace += String(char)
    }

    let setNoSpace = Set(nospace.lowercased())

    return alphabets == setNoSpace
}
allAlphabets(it: "quick brown fox jumps over the lazy")

func removeVowels(str: String) -> String {

    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "y"]  // n
    
    var newStr = str.lowercased()  // m
    
    var ansStr = ""

    for vowel in vowels {
        ansStr = newStr.filter {$0 != vowel}  // O(n * m)
        newStr = ansStr
    }
    return ansStr
}

removeVowels(str: "These are the voyages of the starship Enterprise")

func reverseString(str: String) -> String {
    var reverseStr = ""
    for char in str {
        reverseStr = String(char) + reverseStr
    }
    return reverseStr
}

reverseString(str: "hello")

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

patternMatch(sentence: "apple banana apple", pattern: "eye")

   func reverseString2 (str: inout [Character]) {
        var left = 0
        var right = str.count - 1

        while left < right {
            let first = str[left]  // h
            let last = str[right]  // o

            str.remove(at: left)
            str.insert(last, at: left)
            str.remove(at: right)
            str.insert(first, at: right)

            left = left + 1
            right = right - 1

        }
    }

func sequenceCounting(str: String) -> String {
    
    var currentCounter = 0
    
    var previousCounter = 0
    
    var currentChar = ""
    
    let strArray = Array(str)
    
    var ansString = [String]()
    
    for char in strArray {
        
        if currentChar != String(char) {
            print("not equal")
            currentCounter = 1
            previousCounter = currentCounter
        }
        
        if currentChar == String(char) {
            currentCounter += 1
            print("equal")
        }
    
         currentChar = String(char)
        
        if currentCounter > previousCounter {
            print("higher")
            ansString.popLast()
            ansString.append(("\(currentCounter)\(char)"))
        } else {
            ansString.append(("\(previousCounter)\(char)"))
        }
    }
    
    return ansString.joined(separator: ",")
}

print(sequenceCounting(str: "abccdacc"))


func groupingAnagrams(arr: [String]) -> [[String]] {
    var answer = [[String]]()
    var anaDict = [String: [String]]()
    
    for words in arr {
        let sortedString = String(words.sorted())
        if anaDict[sortedString] == nil {
            anaDict[sortedString] = [words]
        } else {
            anaDict[sortedString]?.append(words)
        }
    }
    
    for (key,value) in anaDict {
        answer.append(value)
    }
    
    return answer
}

print(groupingAnagrams(arr: ["eat", "tea", "tan", "ate", "nat", "bat"]))
