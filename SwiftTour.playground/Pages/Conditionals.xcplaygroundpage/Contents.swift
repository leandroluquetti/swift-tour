//: [Voltar para Control Flow](@previous)
//: ## Condicionais
//: If
var temperatureInFarenheit = 30
if temperatureInFarenheit <= 32 {
    print("Muito frio")
} else if temperatureInFarenheit >= 86 {
    print("Muito quente")
} else {
    print("De bunas")
}

//: Switch
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) é vogal")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) é consoante")
default:
    print("\(someCharacter) nem um nem outro")
}

// Switch com interval
let approximateCount = 62
let countedThings = "luas em Saturno"
var naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "nenhuma"
case 1..<5:
    naturalCount = "algumas"
case 5..<12:
    naturalCount = "muitas"
case 12..<100:
    naturalCount = "duzias de"
case 100..<1000:
    naturalCount = "centenas de"
default:
    naturalCount = "num sei"
}
print("há \(naturalCount) \(countedThings).")

// Switch com tuplas
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("origem")
case (_, 0):
    print("\(somePoint.0),0) está no eixo x")
case (0, _):
    print("(0, \(somePoint.1)) está no eixo y")
case (-2...2, -2...2):
    print("(\(somePoint.0, somePoint.1)) está dentro do quadrado")
default:
    print("(\(somePoint.0, somePoint.1)) está fora do quadrado")
}

// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("no eixo x com um valor de \(x)")
case (0, let y):
    print("ono eixo y com valor de \(y)")
case let (x, y):
    print("em algum lugar com os valores (\(x), \(y))")
}


// Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) estao alinhados")
case let (x, y) where x == -y:
    print("(\(x), \(y)) são opostos")
case let (x, y):
    print("(\(x), \(y)) não tem relação")
}

//: Control Transfer Statements
// Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
puzzleOutput

// Break
let numberSymbol: Character = "三"  // Chinese for the number 3”
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("O valor de \(numberSymbol) é \(integerValue).")
} else {
    print("\(numberSymbol) não possui valor inteiro")
}

// Fallthrough
let integerToDescribe = 5
var description = "O numero \(integerToDescribe) é"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " primo"
    fallthrough
default:
    description += ", e tambéminteiro."
}
print(description)

// Early Exit
// Guard
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Olá \(name)!")
    
    guard let location = person["location"] else {
        print("Espero estar bem aí.")
        return
    }
    
    print("Espero que esteja tudo bem em \(location).")
}
greet(person: [:])
greet(person: ["name": "John"])
greet(person: ["name":"Jane", "location": "Cupertino"])


// Checking API Availability
if #available(iOS 9, OSX 10.12, *) {
    print("Use iOS 9 APIs on iOS, and use OS X v10.10 APIs on OS X")
} else {
    print("Fall back to earlier iOS and OSX APIs")
}


//: [Ir para Functions](@next)
