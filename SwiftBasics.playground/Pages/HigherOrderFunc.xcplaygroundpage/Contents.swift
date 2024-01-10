//: [Previous](@previous)

import Foundation

var greeting = "Higher Order Function"

/*
    -   Higher-order functions are functions that take other functions as arguments or return functions as their output
    -   Map,Filter,Reduce,Sorted
 */

/*
 MAP
 =====
 1. Map takes clouser as its argument and applies it to each element in a sequence, returning a new sequence of transformed elemenet
 
 */

let numbers = [1,2,3,4,5]
let double = numbers.map{$0*2}
print(double)

let numberString = ["1","2","3","4","5",nil]
let intNumber = numberString.map{Int($0 ?? "0") ?? 0}
print(intNumber)


/*
 CompactMap:
 ============
    1. it similar to map but compactmap filter nil from array and perform operation
 
 */

let numberWithNil = [1,2,3,4,nil,5,6,nil,7]
let doubleCompact = numberWithNil.compactMap{$0}.map{$0*2}
print(doubleCompact)


/*
 ForEach
 ======
    The forEach function is used to perform an action on each element of a sequence. Unlike the map function, which returns a new sequence of transformed elements, forEach does not return a value. Instead, it simply performs the specified action on each element of the sequence
 */

let words = ["apple","orange","mango"]
words.forEach { word in
    word+" Hello"
}

print(words) // it return same array data, because foreach wont return any value, it just use the sequence of data from array


var counter = 0
let numberdata = [1,2,3,4,5,6,7,8]
numberdata.forEach { num in
    if(num%2 == 0){
        counter += 1
        
    }
}
print(counter)


/*
 filter
 =======
    -   The filter function takes closure as its argument and returns a new sequence containing only the elements that match a certain condition
    -
 */

let numbersFilter = [1, 2, 3, 4, 5]
let doublefilter = numbersFilter.filter{$0%2==0}
print(doublefilter)


let numbersFilt = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let evenSeq = numbersFilt.filter{$0%2==0}.map{$0*$0}

print(evenSeq)


/*
 Sorted
 =======
 -  The sorted function returns a new, sorted array of elements from a sequence
 -  The elements are sorted according to the provided closure, which is a function that takes two elements as its input and returns a Boolean value indicating whether the first element should come before the second element in the sorted array.
 
 
 */


let numberSort = [5,7,2,4,1,6]
let sortedNum = numberSort.sorted(by: {$0>$1})
print(sortedNum)


let wordSort = ["apple", "cherry","banana",  "date"]
let sortedWord = wordSort.sorted(by: {$0 > $1})
print(sortedWord)


/*
 Reduce
 ======
    The reduce function takes closure as its argument and combines all the elements in a sequence to produce a single value
 */

//let result = sequence.reduce(initial, combine)

let numberReduce = [1,2,3,4,5]
let totalarray = numberReduce.reduce(0, {$0+$1})
print(totalarray)


let wordReduce = ["Geeks" , "for" , "Geeks"]
let word = wordReduce.reduce("", {$0 + " " + $1})
print(word)
