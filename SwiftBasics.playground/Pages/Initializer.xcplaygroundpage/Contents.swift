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
//: [Next](@next)
