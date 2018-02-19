//: [Voltar para Functions](@previous)
/*:
## Closures
>As closures são utilizadas para a criação de funções inline. Com elas podemos criar blocos de códigos que podem atuar como variáveis ou funções. Para quem conhece Objective-C, podemos dizer que as closures são equivalentes aos blocos ou, fazendo uma analogia com outras linguagens de programação, podemos dizer que são como callbacks e lambdas.
*/
//: Closure Expressions
// Sort Function
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// Closure Expression Syntax
reversedNames = names.sorted(by: { (s1:String, s2: String) -> Bool in return s1 > s2 })

// Inferring Type from from Context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// Implicit returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 })

// Operator Functions
reversedNames = names.sorted(by: >)


// Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> ()) {
    
}
someFunctionThatTakesAClosure(closure: {
    
})
someFunctionThatTakesAClosure() {

}

reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4:"Four",
    5: "Five", 6:"Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
strings


// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

// Closures are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// Escaping Closures
var completionHandlers: [() -> Void] = []
func soneFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        soneFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
//let p = completionHandlers.first!
//p()
print(instance.x) // Prints "200"

//: ## Autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Servindo \(customerProvider())!")
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Servindo \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

// Mesmo removendo o primeiro elemento dentro da closure, essa operação não será executada até que a closure seja invocada.

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Servindo \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0) )

// No exemplo acima temos a mesma função porem usando autoclosure, então podemos passar diretamente a string


//: @autoclosure(escaping)
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Agora temos \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Servindo \(customerProvider())!")
}

//: [Ir para Enums](@next)
