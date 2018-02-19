//: [Voltar para o Básico](@previous)
//: ## Operadores de atribuição

let name = "Carlos Alberto"
var age = 28
let numbers = (x: 33.0, y: "Pamonha", z: 89)
numbers.y

//: >ao contrario dos operadores de atricuição em C e Objective-C
//: >os operadores de atricuição em Swift não retornam nenhum valor
//: >o código abaixo não pode ser usado

//if x = y {
// código inválido
//}

//: ## Operadores aritméticos

let soma = 2 + 2
let subtração = 20 - 10
let multiplicação = 250 * 5
let divisão = 400 / 4
var restoDaDivisão = 33 % 5

"hello, " + "world"

let dog = "🐶"
let cow = "🐮"
let dogcow = "🐶" + "🐮"

//: ## Operadores compostos
var num = 120
num += 10

var x = 39.6
x -= 15.1

var y = 32.5
y *= 2

var z = 20
z /= 2

var r = 33
r %= 5


//: ## Operadores de comparação
var a = 3
var b = 6

a == b
a != b
a > b
a < b
a >= 1
a >= 4
a <= 1
a <= 3
a <= 0

let person = "Carlos Alberto"
if person == "Carlos Alberto" {
    print("Olá, Carlos Alberto")
} else {
    print("Desculpe \(person), não te conheço")
}


//: ## Operadores ternários
var who = (person == "Carlos Alberto") ? "É o Carlos" : "Sei lá quem é"

var value = 5
var result = (value >= 5) ? "Passou de ano" : "Não deu"

var isTrue = true
var maybe = (isTrue) ? "É verdade mesmo" : "Não é verdade"

//: ## Operadores de Range
// Closed Range Operator
for index in 1...5 {
    print("\(index) vezes 5 é \(index * 5)")
}

// Half-Closed range operator
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("O índice \(i + 1) se chama \(names[i])")
}

//: ## Operadors Lógicos
let allowedEntry = false
if !allowedEntry {
    print("ACESSO NEGADO")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Bem-Vindo!")
} else {
    print("ACESSO NEGADO")
}

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Bem-Vindo!")
} else {
    print("ACESSO NEGADO")
}

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Bem-Vindo!")
} else {
    print("ACCESS DENIED")
}

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Bem-Vindo!")
} else {
    print("ACCESS DENIED")
}

//: ## Criação de Operadores
postfix operator ++
postfix operator --

postfix func ++ (value: Int) -> Int {
    return value + 1
}

postfix func -- (value: Int) -> Int {
    return value - 1
}

let k = 35
k++
k--
//: [Ir para String](@next)
