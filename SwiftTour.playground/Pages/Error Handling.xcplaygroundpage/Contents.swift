//: [Voltar para Type Casting](@previous)

import Foundation
/*:
### Error Handling
Em Swift, os erros são representados por value types que estejam em conformidade com o protocolo *ErrorType*. Este protocolo indica que um tipo pode ser utilizado para o tratamento de erros.

Há quatro maneiras de lidar com erros em Swift. Você pode propagar o erro de uma função para o código que chama essa função, manipular o erro usando uma instrução do-catch, manipular o erro como um optional value ou afirmar que o erro não ocorrerá. Cada abordagem é descrita numa secção abaixo.
*/

//: **Representanto e lançando Errors**

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

//: **Propagating Errors Using Throwing Functions**
func canThrowErrors() throws -> String {
    return ""
}

func cannotThrowErrors() -> String {
    return ""
}

//: Exemplo
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

//: **Tratando Errors usando Do-Catch**

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// prints "Insufficient funds. Please insert an additional 2 coins."

//: **Convertando Errors usando Optional Values**

func someThrowingFunction() throws -> Int {
    // ...
    return 0
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

//: **Desabilitando a propagação de error**

//let photo = try! loadImage("./Resources/John Appleseed.jpg")

//: **Especificando ações de Cleanup**

//func processFile(filename: String) throws {
//    if existsA(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // Work with the file.
//        }
//        // close(file) is called here, at the end of the scope.
//    }
//}






