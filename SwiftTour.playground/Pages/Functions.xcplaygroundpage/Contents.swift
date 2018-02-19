//: [Voltar para Controle de Fluxo](@previous)
/*: 
### Funções
*/
//: Criando uma função
func imprimirNaTela() {
    print("Função simples sem parâmetros")
}

//: Chamando uma função.
imprimirNaTela()

//: Funções com parâmetros
func retorna(texto: String) -> String {
    let textoRetorno = "Inicio \(texto) Fim"
    return textoRetorno
}

func retorna(_ texto: String = "Pelé", xuxa: String = "Xuxa") -> String {
    let textoRetorno = "Inicio \(texto) Fim \(xuxa)"
    
    return textoRetorno
}

retorna(texto: "Oi, meu nome é Gervásio")
retorna("blablalba", xuxa: "pelé")
retorna(xuxa: "qwe")


//: Funções que retornam mais de um valor
func minMax(_ array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let array = [1,2,3,4,5,6,7,8,9]

minMax(array)

/*: 
### Funções de sistema
	**min** Retorna o menor valor de uma sequencia
*/
var menor = min(1000,7,3171,3080)
print("Menor Valor: \(menor)")

/*:
	**max** Retorna o maior valor de uma sequência
*/
var maior = max(1000,7,3171,3080)
print("Maior Valor: \(maior)")

/*:
	**sort** Utilizamos esta função para ordenar coleções.
*/
var numeros = [10,5,7,2,3,9,1]
numeros.sorted(by: >)
print(numeros)

/*:
	**dump** Exibe o conteúdo de um array de forma detalhada e em formato de árvore.
*/
class Pet {
    var type = "Cachorro"
}

class Person {
    var name = "Salmo"
    var age = 18
    var pet = Pet()
}

let salmo = Person()
dump(salmo)

let linguagens = ["Objective-C", "Swift", "C", "PHP", "Python"]
dump(linguagens)

/*:
	**join** Função utilizada para adicionar um elemento/separador/caractere entres os elementos de uma coleção.
*/
let operacoes = ["soma", "divisão", "multiplicação", "divisão", "resto"]
var operacoesJuntas = operacoes.joined(separator: "-")
print("Operações juntas \(operacoesJuntas)")


//: [Ir para Closures](@next)
