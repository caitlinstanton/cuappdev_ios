//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "hi"

let constantInt = 2
let constantDouble = 2.0
let constantFloat: Float = 2.0
let cgFloat: CGFloat = CGFloat(4)

var mutableInt = 1
var mutableString = "qwerty"
mutableString = "abc"

let plus = Double(constantInt) + constantDouble
let booleanExpression: Bool = true || false

let arrayExample: [Any] = [1.0, "hello", 1]

for item in arrayExample {
    print(item)
}

let button = UIButton(type: .roundedRect)

var emptyArray = [UIButton]()

for i in 0 ..< 9 {
    emptyArray.append(UIButton())
}

var constantDictionary: [Int: String] = [1:"bye", 7: "number"]
constantDictionary[7]
constantDictionary[3] = "yolo"
constantDictionary[3] = nil

var x: Int? = 1
print(x)
x = nil
x = 4

if let unwrappedX = x {
    print(unwrappedX)
    let b = unwrappedX + 1
}

func aFunction(a:Int, b: Float, c: [String], d: [String: Int]) -> Bool {
    let x = 1
    print(x)
    return true
}

func negateinteger(i: Int) -> Int? {
    if i > 0 || i < 0 {
        return i * -1
    } else {
        return nil
    }
    
}

let z = negateinteger(i: 0)
if let unwrappedZ = z {
    
}

class Person {
    
    var name: String
    var sex: String
    var age: Int
    let planet = "Earth"
    
    init(name: String, sex: String, age: Int) {
        self.name = name
        self.sex = sex
        self.age = age
    }
    
    func sayHi() {
        print("Hi, my name is \(name)!")
    }
    
}

let caitlin = Person(name: "Caitlin", sex: "Female", age: 18)
caitlin.sayHi()

let anotherReferenceToCaitlin = caitlin

caitlin.sex = "Don't assume"
print(anotherReferenceToCaitlin.sex)

let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
textField.text = "Hello"
let y = textField.text
