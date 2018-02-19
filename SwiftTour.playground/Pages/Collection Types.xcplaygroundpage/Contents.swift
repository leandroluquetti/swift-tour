//: [Voltar para Strings](@previous)
/*: 
## Collection Types
>As Collection Types são tipos de dados que armazenam coleções de um tipo determinado. A Swift apresenta três tipos de Collection Types: Array, Dicionários e Set. Arrays são coleções ordenadas. Sets são coleções não ordenadas de valores exclusivos. Os dicionários são coleções não ordenadas de associações de chave-valor. Porem ser mutaveis ou imutáveis, dependendo do tipo da declaração let ou var.
*/
//: ## Array
//: >As varias formas de se iniciar um Array

var simpleArray = [String]()
print("simpleArray é do tipo [String] com \(simpleArray.count) itens.")

var explicitArray : Array<String> = Array()
var rangeArray = [1...50, 1...45]
var fullArray = Array(["Oi", "tchay"])
var anyObjectArray = [AnyObject?]()
var threeDoubles = Array(repeating: 0.0, count: 3)
var literalArray = ["One", "Two", "Three"]

//: Acessando um Array
rangeArray[0]
rangeArray.last
rangeArray.first

//: Adicionando elementos a uma array
simpleArray.append("Leandro")
simpleArray += ["Rodrigo"]
simpleArray += ["Fernanda", "Maria", "Cleide"]

//: Alterando valores
simpleArray[0] = "Joana"
simpleArray[1...3] = ["Jailson", "Edmundo"]

//: Adicionando em indices específicos em um array
simpleArray.insert("Bruno", at: 4)


//: Contando quantidade de itens em um array
simpleArray.count

//: Iterando um array

for name in simpleArray {
    print(name)
}

for (index, value) in simpleArray.enumerated() {
    print("Item \(index + 1): \(value)")
}

//: Removendo um elemento
simpleArray.removeLast()
simpleArray.removeFirst()
simpleArray.remove(at: 1)
simpleArray.removeAll()

//: ## Set
//: Formas de iniciar um Set
var letters = Set<Character>()
print("letters é do tipo Set<Character> com \(letters.count) itens.")

letters.insert("a")
letters = []
// letters está vazio, porém ainda é do tipo Set<Character>

//: Criando um Set com array
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
let alsoFavoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

//: Acessado e modificando um Set
print("Eu tenho \(favoriteGenres.count) gêneros musicais favoritos.")

if favoriteGenres.isEmpty {
    print("Num curto música não.")
} else {
    print("Sonzera!.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Jazz") {
    print("\(removedGenre)? Cancei.")
} else {
    print("Nunca nem vi.")
}

if favoriteGenres.contains("Rock") {
    print("Let's Rock.")
} else {
    print("Not so rocky.")
}

//: Iterando Set
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//: Operaçoes com Set
let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

//: ## Dicionários
//: Varias forma de declarar um dicionário
var explicitDictionary: Dictionary<String, String> = Dictionary()
//leterals
var airports: [String: String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]

//: Adicionando valores ao dicionario
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

//: Acessando e modificando Dictionary
print("airports contem \(airports.count) itens.")

if airports.isEmpty {
    print("o dicionário está vazio.")
} else {
    print("o dicionário não está vazio.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    print("O valor antigo para DUB era \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("O nome do aeroporto é \(airportName)")
} else {
    print("Não conhecemos esse aeroporto.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("Acabamos de remover \(removedValue).")
} else {
    print("Não removemos nenhum aeroporto.")
}

//: Iterando Dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//: [Ir para Control Flow](@next)
