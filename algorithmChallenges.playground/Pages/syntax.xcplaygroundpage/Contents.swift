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
    let closingSyntax: [Character: Character] = ["(":")", "[": "]", "{":"}"]
    
    var inputStack = Stack()
    for char in input {
        switch char {
        case "[", "(", "{":
            inputStack.push(element: char)
        case "]", ")", "}":
            guard let lastOpenedChar = inputStack.pop(),
                let closingSymbolNeeded = closingSyntax[lastOpenedChar],
                closingSymbolNeeded == char else {
                    return false
                }
        default:
            break
        }
    }
    return inputStack.isEmpty()
}

match(input: "x(y(z{test})abc)") // should return true
match(input: "()") // should return true
match(input: "([)]") // should return false
match(input: "[[]](()){{{}}}") // should return true
match(input: "abc(def(ghi)") // should return false

