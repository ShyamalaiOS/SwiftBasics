import Foundation

//StoredComputed
//Properties are associated value with Structure , class and Enum
// 1. Store Property
// 2. Computed Property

/* Stored Property
 ------------------
    - Values Stores as part of the instansiation
    - it provided only Classes and Struct
    - if we created instance of strucure and assign as to Constant, we cant modify that instance property
 
   - Lazy can be used
 
 
    
*/
struct Person{
    var name : String  // VAriable strored Property
}
let person = Person(name: "Geeks for Geeks")

print("The Person name is \(person.name)")


struct Employee{
    let name : String // Constant Stored Property
    var email : String // Variable Stored Property
    lazy var phone : String = "990099888" // Lazy store Property
}

let emp = Employee(name: "Shyamala", email: "Shyamala@maang.com")
//emp.name = "Cant assign value"
//emp.email = ""  // Cont assign even for var bcz it is constant struct instance

var empVariable = Employee(name: "Zoho", email: "zoho@gmail.com")
empVariable.email = "Zolo@gmail.com"
print("Employee Details", emp.name,emp.email)


//Lazy Stored Property
//------------------------
//   it defer from initialization of the propery until its first use , ex : NSURL
// A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used.
// Lazy holds only var property not constant (LEt)
// Using the lazy keyword isn’t allowed for computed properties

class GFG{
    var  Cname : String?
    
    lazy var course : String = {[weak self] in
        guard let x = self else {return "Doesnt wrap its self"}
        guard let y = self?.Cname else {return "Course not found"}
        return "Course is y: \(y)"
    }()
    init(Cname: String? = nil) {
        self.Cname = Cname
    }
}

let y = GFG(Cname:"Swift")
print("\(y.course)")



// Computed Property
//----------------------
  // it provied by Class,Struct and enum
  // It calculate value rather than store
  // it donot strore value, instead of it use get and set to retive and set value of the property
  // ** It can be assigned  var , but cannot be assign for Constant LET
  // LAZY cant be used in computed property

struct Rectangle{
    var len : Double
    var width : Double
    
//    lazy var perimeter : Double{
//        get{
//            return (2*(len+width))
//        }set(newPerimeter){
//            len = (newPerimeter - width)/2
//        }
//    }
    
     var perimeter : Double{
        get{
            return (2*(len+width))
        }set(newPerimeter){
            len = (newPerimeter - width)/2
        }
    }
}

var ob = Rectangle(len: 10, width: 5)
print(ob.perimeter)

ob.perimeter = 40
print("Length",ob.len)


//Read only computed Property

struct CuboidVolume{
    var w = 0.0 , h = 0.0, d = 0.0
    var CVolume:Double{
        return w*h*d
    }
}

let cuboid = CuboidVolume(w: 10,h: 20,d: 30);
print("Cuboid Volume",cuboid.CVolume)

/*
    Default Store Property
 --------------------------
 
 When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.
 
 
 */

struct Fahrenheit {
    var temperature = 32.0 // Default property Value
}


/*Type Property
---------------
 - Instance properties are property that belongs to an instance of particular type
 - You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instances of that type you create
 - Property are usefull for defineing value in universal to all instance of particular type
 
 - Unlike stored instance properties, you must always give stored type properties a default value.
 
 - lazy no need, its already lazy property only
 
 - You define type properties with the static keyword. ***
 
 - computed type properties for class types, you can use the class keyword instead to allow subclasses to override the superclass’s implementation. ***
 
 - Type properties in classes, due the their reference type, will use the keyword static if the type property is not meant to be overridden by a subclass, and the keyword class if it does (in that situation, in the subclass you also must use the keyword override to signal to the compiler that the subclass is implementing it’s own type property)
 
*/


struct SomeStructure {
    static let storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

class SomeSubClass : SomeClass{
    override class var overrideableComputedTypeProperty : Int {
        200
    }
}

SomeClass.storedTypeProperty = "Hello"




// Property Observer
//---------------------

 /*
   - It Monitor the changes in a property
  
  */
