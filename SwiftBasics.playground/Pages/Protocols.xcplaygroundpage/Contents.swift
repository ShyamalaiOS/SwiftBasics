import UIKit

var greeting = "Hello, playground"


protocol SomeProtocol{
    
}

struct SomeStrue : SomeProtocol{
    
}

class SomeSuperClass{
    
}
// while confirming we should give class name the protocol
class SomeSubClass : SomeSuperClass,SomeProtocol{
    
}

/*
 Property
 ---------
   - Protocol Required any type of instance and Type Property with particular name and type
   - The protocol doesn’t specify whether the property should be a stored property or a computed property
   - protocol also specifies whether each property must be gettable or gettable and settable
 
 * - protocol only requires a property to be gettable,  that will be constant stored property and read only computed property
 
   - Property requirements are always declared as variable properties (Var)
 */

protocol BasicProtocol{
    var instanceProperty : Int {get set}
    var storedProperty : Int {get}
    static var typedProperty : Int {get}
    
//     let typedPropertys : Int {get} //'let' declarations cannot be computed properties
}

struct BasicStruct : BasicProtocol{
    
    var instanceProperty: Int
    
    var storedProperty: Int = 0 // stored property
    
//    var storedProperty: Int {  // here we make it as red only computed property
//        return instanceProperty
//    }
    
    static var typedProperty: Int = 10
    
    
}

var instanciation = BasicStruct(instanceProperty: 0, storedProperty: 2)
instanciation.instanceProperty = 10
instanciation.storedProperty = 30
BasicStruct.typedProperty = 40

/*
 Methods
 -------
   - Protocol can specific instance method and typed method to be implemented by conforming type
   - Default values, however, can’t be specified for method parameters within a protocol’s definition
   - As type property requirement, always prefix with type method requirement with Static Keyword
 */

protocol MethodProtocol{
    func sampleFun()
    static func typeFunction()
    func paramertiedFunc(name : String)
//    func funcwithReturnValue(name : String = "shyam") -> Bool
//    Default argument not permitted in a protocol method
    func funcwithReturnValue(name : String) -> Bool
}

class MethodClass : MethodProtocol{
    func sampleFun() {
        print("Sampled Fun")
    }
    
    static func typeFunction() {
        print("Sampled Static Fun")
    }
    
    func paramertiedFunc(name: String) {
        print("Sampled Prameterised Fun with name \(name)")
    }
    
    func funcwithReturnValue(name: String) -> Bool {
        print("Sampled func with return type")
        return true
    }
}

let classinstance = MethodClass()
classinstance.sampleFun()
classinstance.paramertiedFunc(name: "Hello World")
classinstance.funcwithReturnValue(name: "Retunrn data")
MethodClass.typeFunction()


/*
 Mutating Method Requirements
 ----------------------------
 
    - For instance methods on value types (that is, structures and enumerations) you place the mutating keyword
    - If you mark a protocol instance method requirement as mutating, you don’t need to write the mutating keyword when writing an implementation of that method for a class. The mutating keyword is only used by structures and enumerations.
    
 */

protocol Togglable{
    mutating func toggle()
}

enum OnOffSwitch : Togglable{
    case on , off
    mutating func toggle() {
        switch self{
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var lightSwitch = OnOffSwitch.on
lightSwitch.toggle()
print("Switch Status",lightSwitch)



/*
 Initialize :
 ------------
    - Protocol initializer to implemented by conforming type.
    - you must initialize this as part of protocal definition as like normal initialize without specifing curly brace
    - You can implement a protocol initializer requirement on a conforming class as either a designated initializer or a convenience initializer.
    - in both designated and convenience initializer we need required modifier
    - required modifier ensures that you provide an explicit or inherited implementation of the initializer
    -The use of the required modifier ensures that you provide an explicit or inherited
 */

protocol InitProtocl{
    init(param : String)
    init(paramList : [String])
//    convenience init(paramList : [String])
}

class InitClass : InitProtocl{
    required init(param: String) {
       
    }
    required convenience init(paramList: [String]) {
        self.init(param: paramList[0])
    }
}

protocol SomeInitProtocol {
    init()
}


final class SomeInitSuperClass : SomeInitProtocol {
    init() {
        // initializer implementation goes here
    }
}

class OverrideInitSuperClass {
    init(){}
}

class OverrideInitSubclass : OverrideInitSuperClass,SomeInitProtocol{
    required override init(){}
}

//class someInitSubclass : SomeInitSuperClass{  // **Inheritance from a final class 'SomeInitSuperClass'
//
//}
