//: [Enums](@previous)
/*:
 ## Classes
 >A Programação Orientada a Objetos foi uma grande mudança de paradigma no desenvolvimento de aplicações, trazendo estruturas semelhantes às do mundo real para dentro da programação. Utilizando esse paradigma, podemos construir aplicações robustas e mais eficientes, gerando menos esforço para manutenção e mais reutilização de códigos.
 >Suas instâncias são sempre passadas por referência
 */
/*:
 ## Structs
 >Uma Struct nos permite criar um tipo de dado estruturado que fornece um armazenamento de dados usando propriedades e funcionalidades através de métodos. É semelhante ao conceito de orientação a objetos, mas na verdade o conceito de Struct é mais simples do que uma classe, pois não permite herança.
 >Suas instâncias são sempre passadas por valor, diferentemente de classes, que são passadas por referência.
 */

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()
print("resolution width: \(someResolution.width)")
print("video width: \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("video width: \(someVideoMode.resolution.width)")

//: Memberwise Initializers
// Structs tem inicializadores gerados automaticamente
let vga = Resolution(width: 640, height: 480)

//: Value Type
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema: \(cinema.width) pixels")
print("hd: \(hd.width) pixels")

//: Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("tenEighty frame rate: \(tenEighty.frameRate)")

// Identity Operators
if tenEighty === alsoTenEighty {
    print("mesma instancia")
}

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

//: [Properties](@next)
