//: [Previous](@previous)

import Foundation

class AwesomeClass {
    @objc dynamic func originalFunction() -> String {
        return "originalFunction"
    }
    
    @objc dynamic func swizzledFunction() -> String {
        return "swizzledFunction"
    }
}

let awesomeObject = AwesomeClass()

print(awesomeObject.originalFunction()) // prints: "originalFunction"

let aClass = AwesomeClass.self
let originalMethod = class_getInstanceMethod(aClass, #selector(AwesomeClass.originalFunction))
let swizzledMethod = class_getInstanceMethod(aClass, #selector(AwesomeClass.swizzledFunction))
method_exchangeImplementations(originalMethod, swizzledMethod)

print(awesomeObject.originalFunction())  // prints: "swizzledFunction"
//: [Next](@next)
