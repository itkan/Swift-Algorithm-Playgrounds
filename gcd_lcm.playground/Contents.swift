import UIKit
import XCTest

// Greatest Common Divisor
func gcd(a:Int,b:Int) -> Int {
    let t = a % b
    
    if t == 0 {
        return b
    }else {
        return gcd(a: a,b: t)
    }
}

let result1 = gcd(a: 48, b: 18)
XCTAssertTrue(result1 == 12)
print("gcd(a: 48, b: 18) = \(result1)")

let result2 = gcd(a: 180, b: 48)
XCTAssertTrue(result2 == 36)
print("gcd(a: 180, b: 48) = \(result2)")

// Least Common Multiple
func lcm(a:Int,b:Int) -> Int {
    let gcdResult = gcd(a: a, b: b)
    let result =  (a*b) / gcdResult
    return result
}

let result3 = lcm(a: 3, b: 2)
print("lcm(a: 2, b: 3) = \(result3)")
XCTAssertTrue(result3 == 6)

let result4 = lcm(a: 12, b: 6)
print("lcm(a: 12, b: 6) = \(result4)")
XCTAssertTrue(result4 == 12)


let result5 = lcm(a: 14, b: 8)
print("lcm(a: 14, b: 8) = \(result5)")
XCTAssertTrue(result5 == 56)