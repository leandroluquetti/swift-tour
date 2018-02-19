//: [Swizzle](@previous)
//: ## Generics

import UIKit

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt é \(someInt), e anotherInt é \(anotherInt)")

// A função acima é util, porém pode ser usado apenas com Integer
// Se você deseja trocar outros valores como String ou Double presisará criar outras funções

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//: Generic Functions
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt é \(someInt), e anotherInt é \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString é \(someString), e anotherString é \(anotherString)")


//: Generic Types
// Non-generic version of a Stack first
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// Now a Generic version
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("catorce")
stackOfStrings

let fromTheTop = stackOfStrings.pop()

// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("O item do topo é: \(topItem).")
}

//: Type Constraints
/*
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 
 }
 */

//Non-Generic
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

//Generic
func findIndex<T:Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])


//: Associated Types and Where Clause
internal protocol ViewCustomizable: class {
    associatedtype CustomView
    
    var customView: CustomView { get }
}

extension ViewCustomizable where Self : UIViewController {
    
    var customView: CustomView {
        guard let customView = self.view as? CustomView else { fatalError("cannot parse view") }
        return customView
    }
}

// Generic Where Clauses
protocol Identifiable: class { }

extension Identifiable where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Identifiable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

//: [Error Handling](@next)
