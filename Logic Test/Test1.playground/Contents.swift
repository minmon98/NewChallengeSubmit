import UIKit

// Complexity: O(n)
func findMiddleIndex(array: [Int]) -> Int? {
    var arrayLength = 0
    var totalLeftArray: [Int] = [0]
    for (index, element) in array.enumerated() {
        totalLeftArray.append(element + totalLeftArray[index])
        arrayLength += 1
    }
    guard arrayLength > 2, let totalValue = totalLeftArray.popLast() else {
        return nil
    }
    for (index, element) in totalLeftArray.enumerated() {
        // because totalValue - total of the Left - middle value must equal to total of the Right
        // and total of the Left must equal to total of the Right
        if totalValue - element - array[index] == element {
            return index
        }
    }
    return nil
}

func getResult(array: [Int]) -> String {
    if let index = findMiddleIndex(array: array) {
        return "middle index is \(index)"
    }
    return "index not found"
}

print(getResult(array: [1]))
print(getResult(array: [1, 3]))
print(getResult(array: [1, 3, 1]))
print(getResult(array: [1, -3, -5, 7, -7]))
print(getResult(array: [1, 3, 5, 7, 9]))
print(getResult(array: [3, 6, 8, 1, 5, 10, 1, 7]))
print(getResult(array: [3, 5, 6]))
