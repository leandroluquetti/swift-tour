//: [Voltar para Funções](@previous)
/*:
## Closures
	As closures são utilizadas para a criação de funções inline. Com elas podemos criar blocos de códigos que podem atuar como variáveis ou funções. Para quem conhece Objective-C, podemos dizer que as closures são equivalentes aos blocos ou, fazendo uma analogia com outras linguagens de programação, podemos dizer que são como callbacks e lambdas.
*/

//: Declaramos uma função que recebe uma função como argumento
func multiplicacao(var1: Int, funcaoMult: (Int) -> Int) -> Int {
    return funcaoMult(10)
}

//multiplicacao { (int: Int) -> Int in
//    return int * 2
//}

//: Utilizando uma closure usando in
func aux(valor: Int) -> Int {
    return valor * 3
}

multiplicacao(30) { (valor) -> Int in
    return valor * 3
}

//: Utilizando uma closure de forma mais simplificada
//multiplicacao(30, funcaoMult: {$0 * 3})

//: Forma mais simplificado ainda
multiplicacao {$0 * 3}

//: Outra forma de declarar closure, usando typeAlias
typealias MyCallback = (Double) -> (Double)

func divisao(_ numero:Double, retorno: MyCallback) -> Double {
    return retorno(numero)
}

divisao(10) { (num) -> (Double) in
    num/10
}

divisao(10, retorno: {$0 / 2})
divisao(10) {$0/2}

/*: 
## MAP

	O método map foi feito para simplificar a nossa vida na hora transformar elementos de um array. Vou dar um exemplo: eu tenho um array valores do tipo float e gostaria de converte-los para o tipo string, adicionando a moeda corrente antes do valor.
*/
var dinheiroArray = [100.4, 300.9, 538.7, 3247.9]
var dinheiroStringArray: [String] = []
dinheiroStringArray = dinheiroArray.map({ "R$ \($0)" })
dinheiroStringArray

/*: 
## FILTER

	Outro método espetacular que utiliza closures é o filter, que, como o próprio nome diz, serve para filtrar elementos a partir de uma condição.
*/
var dinheiroFiltrado: [Double] = []
dinheiroFiltrado = dinheiroArray.filter({$0 > 301})
dinheiroFiltrado

/*: 
## REDUCE

	Usamos o método reduce para resolver os problemas de combinarmos o valor de um array em um único valor.
*/
var soma = 0.0
soma = dinheiroArray.reduce(0,{$0 + $1})
soma

//: [Ir para Enums e Structs](@next)
