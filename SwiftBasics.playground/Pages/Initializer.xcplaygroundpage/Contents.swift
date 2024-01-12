//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

/*
 Initializer :
 -------------
   - It is process of propering an instance of a class, struct and enum
   - this is process of setting an initial value for each stored property and perform any other set of initalization, that required before the instace is ready to use
   - Swift initializers don’t return a value
   - Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance creation
   -
    
 
 */

struct Fahrenheit{
    var temperature : Double
    init(){
        temperature = 20
    }
}

let temp = Fahrenheit()
print("Fahrenheit Temperature value is \(temp.temperature)")

struct Fahrenheits {
    var temperature = 32.0 // Default initailizer for property
}

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) { // init with argument lable and paramerter name
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {  // dont have argument lable
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0)


// *** Properties of optional type are automatically initialized with a value of nil

// *** For class instances, a constant property can be modified during initialization only by the class that introduces it. It can’t be modified by a subclass.

class SurvyQuestion{
    var question : String
    let rating : Int
    var response : String?
    init(ask question : String,rating: Int){
        self.question = question
        self.rating = rating
    }
    func ask(){
        print(question)
    }
}

let survy = SurvyQuestion(ask: "Do you like Cheese?",rating:0)
survy.ask()
survy.response = "Yes, I like"
print(survy.response ?? "")
//survy.rating = 20 // error


/*
 Memberwise Initializers for Structure Types
 ------------------------------------------
 Structure types automatically receive a memberwise initializer if they don’t define any of their own custom initializers. Unlike a default initializer, the structure receives a memberwise initializer even if it has stored properties that don’t have default values.
 
 */

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height: 20)
print(zeroByTwo)

/*
 Class And Initializer:
 ======================
 
 -  All of a class’s stored properties — including any properties the class inherits from its superclass — must be assigned an initial value during initialization.
 - Two type of initializer
    1. Designeted initializer
    2. convenience initializer
 */

/*
 DEsignated Initializer:
 ------------------------
    1. Primary initializer for class
    2.it initialize all the property of class and appropriate super class initializer
    3. Every class must have at least one designated initializer
    
 init(<#parameters#>) {
    <#statements#>
 }
 
 Convenience Initializer:
 -------------------------
    1. Convenience initializers are secondary, supporting initializers for a class
    2. You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values
 convenience init(parameters) {
    statements
 }
 
 Rule 1
 A designated initializer must call a designated initializer from its immediate superclass.
 Rule 2
 A convenience initializer must call another initializer from the same class.
 Rule 3
 A convenience initializer must ultimately call a designated initializer.
 
 Designated initializers must always delegate up.
 Convenience initializers must always delegate across.
 
 */

class SuperClassA{
    var addA : Int
    var addB : Int
    var total : Int
    init(addA: Int, addB: Int) {
        self.addA = addA
        self.addB = addB
        self.total = self.addA + self.addB
        print("Totla" , self.total)
    }
    convenience init(onlyA a : Int) {
        self.init(addA: a , addB : 10)
    }
}

let addingDesignated = SuperClassA(addA: 10, addB: 20)
let conveniceInit = SuperClassA(onlyA: 2)

class SubClassB : SuperClassA{
    init(){
        super.init(addA: 40, addB: 50)
    }
    
    convenience init(add : Int){
        self.init()
    }
    convenience init(adds : Int){
        self.init(add: adds)
    }
}

let subClasObj = SubClassB()
print(subClasObj.total)


let subClasObjs = SubClassB(add:20)
print(subClasObjs.total)


let subClasObjss = SubClassB(adds:20)
print(subClasObjss.total)



/*
 Two-Phase Initialization
 ------------------------
    
 */


/*
 Failable Init
 =============
 It’s sometimes useful to define a class, structure, or enumeration for which initialization can fail
 
 This is a failable initializer: an initializer that might work or might not. You can write these in your own structs and classes by using init?() rather than init(), and return nil if something goes wrong.
 
 A failable initializer creates an optional value of the type it initializes
 
 You write return nil within a failable initializer to indicate a point at which initialization failure can be triggered.
 
 
 
 */

struct Person{
    var id : String
    init?(id : String){
        if (id == "")
        {
           return nil
        }else{
            self.id = "Hello \(id)"
        }
    }
}

var personID  = Person(id: "s")
print(personID?.id ?? "")


enum Temperature {
    case kelvin,ferhanhiet,celcius
    init?(symbol : Character){
        switch symbol{
        case  "F" :
            self = .ferhanhiet
        case "K" :
            self = .kelvin
        case "C" :
            self = .celcius
        default :
            return nil
        }
    }
}

let tempdata = Temperature(symbol: "K")
print("Temparature Value is",tempdata)

let tempdatanil = Temperature(symbol: " ")
print("Temparature Value is",tempdatanil)

//
//enum TemperatureRaw : Character{
//    case kelvin,ferhanhiet,celcius
//}
//let tempRaw = TemperatureRaw(rawValue: "S")
//print("Temparature Value is",tempRaw)


/*
 Propagation of Initialization Failure
 -------------------------------------
 A failable initializer of a class, structure, or enumeration can delegate across to another failable initializer from the same class, structure, or enumeration. Similarly, a subclass failable initializer can delegate up to a superclass failable initializer.
 */

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}


class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}


/*
 Required Initializers
 ---------------------
    required modifier before the definition of a class initialize to indicate that every subclass of the class must implement that iniializer
 
 */

class SomeInitSuperClass{
    required init(){
        print("Hello Required init")
    }
}

class SomeSubClass : SomeInitSuperClass{
    
}

let reqInit = SomeSubClass() // here super class required init call automatically


class ClassA{
    required init(){
        print("Hello Class A")
    }
}

class ClassB:ClassA{
    required init() {
        print("Hello Class B")
    }
}


let clasObj = ClassB() // here all required init will call no need of super.init() to call super class initializer

class ClassAParam{
   required init(_ msg : String){
        print("Hello Message",msg)
    }
}

class ClassBParam : ClassAParam{
    required init(_ subclassMsg : String){
        print("Subclass message")
        super.init("Hello super class")  // for parameterize init all we should call baseclass required init with super.init() fun
    }
}

let objMsg = ClassBParam("Hello EveryOne")
//: [Next](@next)
