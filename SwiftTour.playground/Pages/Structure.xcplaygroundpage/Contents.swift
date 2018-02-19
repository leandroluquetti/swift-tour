//: [Previous](@previous)

/*:
## Structs
	Uma Struct nos permite criar um tipo de dado estruturado que fornece um armazenamento de dados usando propriedades e funcionalidades através de métodos. É semelhante ao conceito de orientação a objetos, mas na verdade o conceito de Struct é mais simples do que uma classe, pois não permite herança.

Suas instâncias são sempre passadas por valor, diferentemente de classes, que são passadas por referência.
*/

struct SimpleStructure {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
//: Utilizando uma Struct
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//: [Class](@next)
