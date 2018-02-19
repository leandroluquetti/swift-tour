//: [Previous](@previous)
import UIKit

var data = [Int]()
for i in 0...100 {
    if (i < 20) {
    data.append(Int(arc4random()) % 100)
    }
}


func exchange<T>( data:[T], i:Int, j:Int) -> [T] {
    var data = data
    let temp = data[i]
    data[i] = data[j]
    data[j] = temp
    
    return data
}

data
exchange(data, i: 0, j: 4)
data


var strings = ["A", "B", "C", "D"]
exchange(strings, i: 0, j: 2)
strings
//: [Next](@next)
//: