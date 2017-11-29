//: [Previous](@previous)

import Foundation

struct Stack {
    fileprivate var array: [Character] = []
    
    mutating func push(element: Character) {
        array.append(element)
    }
    
    mutating func pop() -> Character? {
        return array.popLast()
    }
    
    mutating func peek() -> Character? {
        return array.last
    }
    
    func isEmpty() -> Bool {
        return array.count == 0
    }
}

func match(input: String) -> Bool {
    let syntax: [Character: Int] = ["(":0,")":0, "[":0,"]":0,"{":0,"}":0]
    let closingSyntax: [Character: Character] = ["(":")", "[": "]", "{":"}"]
    
    var inputStack = Stack()
    for char in input {
        switch char {
        case "[", "(", "{":
            inputStack.push(element: char)
        case "]", ")", "}":
            guard let lastOpenedChar = inputStack.pop() else {
                return false
            }
            if let closingSymbolNeeded = closingSyntax[lastOpenedChar] {
                if closingSymbolNeeded != char {
                    return false
                }
            }
        default:
            break
        }
    }
    return inputStack.isEmpty()
}
print(match(input: "abc(def(ghi)"))

