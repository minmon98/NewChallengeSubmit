import UIKit

// Complexity: O(n)
func validatePalindrome(string: String) -> Bool {
    var stringLength = 0
    var stringArray: [String] = []
    for character in string {
        stringArray.append(String(character).lowercased())
        stringLength += 1
    }
    if stringLength < 2 {
        return false
    }
    var firstIndex = 0
    var lastIndex = stringLength - 1
    while firstIndex < lastIndex {
        if stringArray[firstIndex] != stringArray[lastIndex] {
            return false
        }
        firstIndex += 1
        lastIndex -= 1
    }
    return true
}

func getResult(string: String) -> String {
    return validatePalindrome(string: string) ? "\(string) is a palindrome" : "\(string) isn’t a palindrome"
}

print(getResult(string: "a"))
print(getResult(string: "aa"))
print(getResult(string: "aKA"))
print(getResult(string: "aka"))
print(getResult(string: "Level"))
print(getResult(string: "Hello"))
