import Foundation

//StoredComputed
//Properties are associated value with Structure , class and Enum
// 1. Store Property
// 2. Computed Property

// Stored Property
    // Values Stores as part of the instansiation

struct Person{
    var name : String  // VAriable strored Property
}
let person = Person(name: "Geeks for Geeks")

print("The Person name is \(person.name)")


struct Employee{
    let name : String // Constant Stored Propery
    let email : String
}

let emp = Employee(name: "Shyamala", email: "Shyamala@maang.com")

print("Employee Details", emp.name,emp.email)


//Lazy Stored Property
//   it defer from initialization of the propery until its first use , ex : NSURL

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
  // it provied by Class,Struct and enum
  // it donot strore value, instead of it use get and set to retive and set value of the property
  // ** It can be assigned LAZY var , but cannot be assign for Constant LET

struct Rectangle{
    var len : Double
    var width : Double
    
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
