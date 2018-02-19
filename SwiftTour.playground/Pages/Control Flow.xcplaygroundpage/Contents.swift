//: [Voltar Collection Types](@previous)
/*: 
## Controle de Fluxo
	Podemos dizer que uma estrutura de controle de fluxo é responsável por repetir um determinado bloco de código até que uma condição específica seja verdadeira. Isso pode parecer confuso a princípio, mas conforme formos avançando, vocês verão que é bem mais tranquilo na prática.
*/

//: ## For-in
//: >usamos for-in para percorrer collections e ranges
for index in 1...5 {
    print("\(index) vezes 5 é \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

// Percorrendo Array com for in
let semestre = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho"]
for mes in semestre {
    print("Estamos no mês \(mes)")
}

// Retornando em um tupla
for (indice, mes) in semestre.enumerated() {
    print(" Na posição \(indice) o mês \(mes)")
}

// Percorrendo Dictionary com for in
let numberOfLegs = ["aranha": 8, "formiga": 6, "gato": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName) tem \(legCount) patas")
}

//: ## While
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    // rola o dado
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move quantidade de casas
    square += diceRoll
    if square < board.count {
        // Se ainda estiver no jogo, move pra cima ou pra baixo
        square += board[square]
    }
}
print("Game over!")

//: ## Repeat While
square = 0
diceRoll = 0
repeat {
    // move pra cima ou pra baixo
    square += board[square]
    // rola o dado
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move quantidade de casas
    square += diceRoll
} while square < finalSquare
print("Game over!")


//: [Ir para Condicionais](@next)
