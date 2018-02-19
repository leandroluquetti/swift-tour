//: [Previous](@previous)


/*:
## Extensitons
    Extensitons podem adicionar novas funcionalidades a uma classe, estrutura, enumeração ou tipo de protocolo existente. Isto inclui a capacidade de estender os tipos para os quais você não tem acesso ao código fonte original (conhecido como modelagem retroativo). Extensitons são semelhantes às categorias em Objective- C. (Ao contrário categorias Objective- C, extensões Swift não têm nomes.)

    Extensitons em Swift podem:

    *Adicionar propriedades de instância e propriedades de tipo
    *Definir métodos de instância e métodos de tipo
    *Fornecer novos initializers
    *definir subscritos
    *Definir e usar novos tipos aninhados
    *Faça um tipo existente em conformidade com um protocolo


    As Extensitons podem adicionar novas funcionalidades a um tipo, mas não pode substituir a funcionalidade existente.
*/

import Foundation

extension Int {
    var simpleDescription: String {
        return "The number \(self)"
    }
}
print(7.simpleDescription)

extension Double {
    mutating func absoluteValue() -> Double {
        if self <= 0 {
            return -self
        } else {
            return self
        }
    }
}

var test = -10.2
let auxDouble = test.absoluteValue()
test
auxDouble

extension Double {
    var abs: Double {
        get {
            return fabs(self)
        }
    }
}


let testDouble = -10.1

testDouble.abs


/*:
## Protocols
    
    Um protocolo define um modelo de métodos, propriedades e outros requisitos que se adequam a uma tarefa ou um pedaço de funcionalidade particular. O protocolo pode ser adotato por uma classe, struct ou enum para fornecer uma implementação efectiva dessas exigências.
*/

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


protocol MyProtocol {
    func doSomethingNonOptionalMethod()
    func doSomethingOptionalMethod()
}

extension MyProtocol {
    func doSomethingOptionalMethod(){
        // leaving this empty
    }
}

class TestClass: MyProtocol {
    func doSomethingNonOptionalMethod() {
    }
}
//: [Next](@next)
