
import Foundation
//Strong reference and weak reference
//retain cycle how ARC handles

class Passport {
    var human: Human?
    let citizenship: String
    init(citizenship: String) {
        self.citizenship = citizenship
        print("You've created an object")
    }
    
    deinit {
        print("I, papepr, am gone")
    }
}

Passport(citizenship: "Bobby")


var myPassPort: Passport? = Passport(citizenship: "Republic of Korea")

myPassPort = nil


class Human {
    var passport: Passport?
    let name: String
    init(name: String) {
        self.name = name
    }
    deinit {
        print("I'm gone, friends")
    }
}


var bob: Human? = Human(name: "Bob Lee")


myPassPort = nil
bob = nil


var newPassport: Passport? = Passport(citizenship: "South Korea")
var bobby: Human? = Human(name: "Bob the Developer")

bobby?.passport = newPassport
newPassport?.human = bobby

// Deinitialization // Deallocate

newPassport = nil
bobby = nil

//GCD

let main = DispatchQueue.main
let background = DispatchQueue.global()
//
func doSyncWork()
{
    background.sync {
        for _ in 1...3 {
            print("Light")
        }
    }
    for _ in 1...3 { print("Heavy") } }

//doSyncWork()

func doAsyncWork() {
    background.async { for _ in 1...10 { print("Light") } }
    for _ in 1...3 { print("Heavy") } }

// main
//doAsyncWork()

//let asianWorker = DispatchQueue(label: "construction_worker_1")
//let brownWorker = DispatchQueue(label: "construction_worker_1")
//func doLightWork() {
//    asianWorker.async { for _ in 1...10 { print("👷") } }
//
//    brownWorker.async { for _ in 1...10 { print("👷🏽") } } }
//
//
////doLightWork()

//let firstQueue = DispatchQueue(label: "queue1", qos: DispatchQoS.userInitiated)
//let secondQueue = DispatchQueue(label: "queue2", qos: DispatchQoS.background)
//firstQueue.sync {
//    for i in 0..<10 {
//        print("🔷", i)
//    }
//}
//secondQueue.sync {
//    for i in 20..<30 {
//        print("⚪️", i)
//    }
//}
//
//let buttonSize = CGRect(x: 0, y: 0, width: 100, height: 100)
//
//let myButton: UIButton = {
//    let button = UIButton(frame: buttonSize)
//    button.backgroundColor = .red
//    button.titleLabel?.text = "Button"
//    button.titleLabel?.textColor = .white
//    button.layer.cornerRadius = 1
//    button.layer.masksToBounds = true
//    return button
//}()

var a = 0
var b = 0

let closure = {
    print(a,b)
}

let new:()->()

new = {
    print(a,b)
}

new()

a = 10

b = 20

new()

var storedClosure: (Int, Int) -> Int = { (number1, number2) in
    return number1 + number2
}

let new1 = storedClosure(10, 20)

print(new1)

var storedClosure1: () -> () = {
    print("dksfj")
}

storedClosure1()

let numbers = ["111","25","22"]

let num = numbers.filter { (someInt: String) -> Bool in
    
    return someInt == "111"
}

// let n = numbers.filter{ $0 %2 == 0}

// print(n)

class myclass{
    var name: String
    init(name: String) {
        self.name = name
    }
}

var ins = myclass(name: "Elango")

ins.name

var newClassInstance = ins

newClassInstance.name = "Zana"

ins.name

func search<T: Equatable>(_ array:[T], _ elememt:T) -> Int
{
    for (index, obje) in array.enumerated() where obje = elememt
    {
        return index
    }
    return nil
}

let array = [12,15,25,18,19,25]

search(array, 12)




