//: [Voltar para Inheritance](@previous)
//: ## Type Casting e DownCasting

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

//:> O compilador consegue deduzir que Movie e Song tem a mesma superclass MediaItem, então ele infere o tipo MediaItem[] para o array abaixo:
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "ElvisPresley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

// Os itens no array ainda são Movie e Song.
// Porém quando iteramos o array os itens retornam como MediaItem.
// Para podermos trabalhar com os itens nnovamente precisamos realizar downcast ou realizar um checagem de tipo

// Checking Type
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("Library contem \(movieCount) movies e \(songCount) songs")


// Downcasting
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}


// Type Casting for Any and AnyObject
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.1459)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })


// O switch usa o force cast para converter os itens (as, não as?). Esse cast é seguro dento do contexto do switch
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    default:
        print("something else")
    }
}

//: [Ir para Extension and Protocols](@next)
