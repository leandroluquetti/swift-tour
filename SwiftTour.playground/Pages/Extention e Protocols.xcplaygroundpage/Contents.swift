//: [Type Casting](@previous)
/*:
## Extensitons
>Extensitons podem adicionar novas funcionalidades a uma classe, estrutura, enumeração ou tipo de protocolo existente.
>Isto inclui a capacidade de estender os tipos para os quais você não tem acesso ao código fonte original (conhecido como modelagem retroativo). Extensitons são semelhantes às categorias em Objective- C. (Ao contrário categorias Objective- C, extensões Swift não têm nomes.)
>Extensitons em Swift podem:

    *Adicionar propriedades de instância e propriedades de tipo
    *Definir métodos de instância e métodos de tipo
    *Fornecer novos initializers
    *definir subscritos
    *Definir e usar novos tipos aninhados
    *Faça um tipo existente em conformidade com um protocolo

 As Extensitons podem adicionar novas funcionalidades a um tipo, mas não pode substituir a funcionalidade existente.
*/

/*
 extension SomeType {
    // novas funcionalidades aqui
 }
 
 extension SomeType: SomeProtocol, AnotherProtocol {
    // implementação dos protocolos aqui
 }
*/

//: Computed Properties
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("uma polegada é \(oneInch) metros")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//: Methods
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}

//: Subscripts
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]

//: Nested Types
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("-")
        case .zero:
            print("0")
        case .positive:
            print("+")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])





/*:
## Protocols
>Um protocolo define um modelo de métodos, propriedades e outros requisitos que se adequam a uma tarefa ou um pedaço de funcionalidade particular. O protocolo pode ser adotato por uma classe, struct ou enum para fornecer uma implementação efectiva dessas exigências.
*/

/*
 protocol SomeProtocol {
    // definição do protocolo
 }

 // Se a classe tiver uma super class ela é a primeira a ser listada, depois vem os protocolos
 class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // definição da classe
 }
 */

//: Property Requirements
// São sempre declarados como properties, prefixo var

protocol ExampleProtocol {
    var simpleDescription: String { get }
    func adjust()
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

//: ## POP

protocol Humanable {
    var name: String { get }
}

extension Humanable {
    func wakeUp() {
        print("Arrrgh")
    }
    
    func goSleep() {
        print("Zzzzz")
    }
}

protocol Developerable: Humanable {
    var languages: [String] { get }
    func develop()
}

extension Developerable {
    func develop() {
        print("u-huuuuu o/ i am developing")
    }
}

protocol MobileDeveloperable: Developerable {
    var likeCalabash: Bool { get }
}

extension MobileDeveloperable {
    func doCalabash() {
        likeCalabash ? print("😃") : print("😕")
    }
}

extension Humanable where Self: Developerable {
    func drinkCoffee() {
        print("drinking coffee")
    }
}

struct Human: Humanable {
    var name: String
}

struct Developer: Developerable {
    var name: String
    var languages: [String]
}

struct MobileDeveloper: MobileDeveloperable {
    var likeCalabash: Bool
    var languages: [String]
    var name: String
}

var renato = MobileDeveloper(likeCalabash: false, languages: ["swift", "objC"], name: "Renato")
renato.doCalabash()
renato.develop()
renato.wakeUp()

var gui = Developer(name: "Gui", languages: [".Net", "C#"])
gui.wakeUp()
gui.goSleep()
gui.develop()

var persio = Human(name: "persio")
persio.goSleep()
persio.wakeUp()

func makeDeveloperDevelop(_ developer: Developerable) {
    developer.develop()
}

makeDeveloperDevelop(renato)
makeDeveloperDevelop(gui)
//: [Next](@next)
