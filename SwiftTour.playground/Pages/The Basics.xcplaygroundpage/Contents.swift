//: [Voltar para Hello World](@previous)
/*:
 ## Variáveis e Constantes
 >A linguagem Swift é fortemente tipada e possui vários tipos de dados,
 >desde os primitivos, como Int, até tipos mais avançados e
 >complexos, como objetos. Cada variável deve ser declarada com
 >um tipo. Caso isso não aconteça, o compilador irá inferir o
 >tipo utilizado ao receber o valor.
 
 >Não podemos, por exemplo, declarar uma variável do tipo inteiro (Int)
 >e tentar inserir um texto (String), pois isso gerará um erro na
 >compilação.
 
 ## Variáveis
 >A palavra reservada `var` será utilizada para declararmos variáveis mutavéis.
 >Ou seja seu valor pode sofrer alteraçoes.
 */

// Declarando variáveis com tipos explícitos
var name: String = "Carlos Alberto"
var age: Float = 33.0
var county: String = "Barão Geraldo", city: String = "campinas"

// Declaração explicita sem valor inicial
var state: String = String()

name = "Carlos Alberto de Nobrega"
age = 89.7

// Declarando variáveis com tipos implícito
var height = 1.80 // implícito Double
var weight = 100 // implícito Int
var nickname = "Zeca" // implícito String

type(of: height)
type(of: weight)

//: ## Constantes
//: >A palavra reservada `let` será utilizada para declararmos variáveis imutavéis, contantes.
//: >Ou seja seu valor não poderá ser alterado após sua inicialização.

// Declarando com tipos implícito
let 🐶 = "cachorro"
let 🐮 = "vaca"

// Declarando com tipos explícitos
let oranges: Int = 4
let apples: Int = 5
let trillion: Double = 1_000_000_000.00

//: ## Print de variáveis
//: >Use `print` para printar as variáveis no console

print("Eu tenho \(apples) maçãs")
print("Eu tenho \(apples + oranges) frutas!")

let greeting = "Olá \(name), você tem \(age) anos de idade e mede "  + String(height) + "m"
print(greeting)

print(🐮, 🐶, separator: ", ", terminator: "!\n")

//: ## Ponto e vírgula (;)
//: >`;` só deve ser usádo quando queremos escrever mais de um comando por linha

let cat = "🐱"; print(cat)

//: ## Numéricos
//: >tipos numéricos e limites

let maxInt: Int = .max
let minInt: Int = .min

let descimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e2

let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//: ## Conversões
//: >conversões numéricas int e float

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
let π = 3 + 0.14159

let integerPi = Int(pi)
let integerFourPointSeven = Int(4.75)
let integerNegativeThreePointNine = Int(-3.9)

//: ## Typealias
//: >podemos redeclarar um tipo com um novo "apelido" para facilitar o entendimento

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // zero

//: ## Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.") //irá cair aqui
}

// Não podemos usar outros tipos além de Bool em controladores de fluxo
let i = 1
/*
 if i {
 
 }
 */
if i == 1 {
    
}

//: ## Tuplas
//: >Tuplas são sequecias ordenadas de objetos customizada

typealias HTTPStatus = (statusCode: Int, message: String)
let http404: HTTPStatus = (404, "Not Found")

let (statusCode, statusMessage) = http404
statusCode
statusMessage
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// Use _ se você quiser descartar um valor
let (justTheStatusCode, _) = http404
print("The status code is \(justTheStatusCode)")

// Você pode acessar os valores da tupla por índices
print("The status code is \(http404.0)")
print("The status message is \(http404.1)")

// Ou pode definir nome para os elementos para poder acessá-los
let http200: HTTPStatus = (statusCode: 200, message: "OK")
print("The status code is \(http200.statusCode)")
print("The status message is \(http200.message)")

// **Dica** Tuplas também podem ser retornadas em funções e métodos ;)


//: ## Optionals
//: >Iremos usar opcionais quando não temos certeza se um valor pode ser nulo ou não

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber deverá ser do tipo "Int?" (optional Int)

// nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
// surveyAnswer será nil antes da inicialização

// Forced Unwrapping

print(convertedNumber!) //NUNCA faça isso

if convertedNumber != nil {
    print("convertedNumber possui valor de \(convertedNumber!)")
}

//: >Optional binding

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' possui valor de \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' não pôde ser convertido para Int")
}

if let firstNumber = Int("4"),
   let secondNumber = Int("42"),
       firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

//: ## Error Handling
//: >Error handling possibilida o tratamento de erros determinados e até o lançameto de erros para serem tratado por outra parte do código

func canThrowError() throws {
    // essa função pode ou não lançar um erro.
}

do {
    try canThrowError()
    // nenhum erro foi lançado
} catch {
    // um erro foi lançado e precisa ser tratado
}

enum SandwichError: Error {
    case OutOfCleanDishes
    case MissingIngredients([String])
}

func makeASandwich() throws {
    throw SandwichError.MissingIngredients(["manteiga","presunto","pão"])
}

func eatASandwich() {
    print("yum yum yum")
}

func washDishes() {
    print("Lave a louça")
}

func buyGroceries(ingredients: [String]) {
    ingredients.forEach{ i in print(i) }
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.OutOfCleanDishes {
    washDishes()
} catch SandwichError.MissingIngredients(let ingredients) {
    buyGroceries(ingredients: ingredients)
} catch {
    print("não deveria cair aqui")
}


//: ## Assertions
//: >Usamos assertions quando precisamos que um valor atenda uma determinada condição para continuar

let idade = 0
//let idade = -3
assert(idade >= 0, "A idade não pode ser menor que zero")
//: [Ir para Operadores](@next)
