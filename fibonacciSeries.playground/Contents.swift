/*
 Fibonacci Series
 
 Fibonacci Series generates subsequent number by adding two previous numbers.
 
 Fn = Fn-1 + Fn-2
 
 The initial values of F0 & F1 to be taken as 0, 1
*/

public class Fibonacci {
    public class func loop(n:Int) {
        var first = 0, next = 1
        
        for i in 0..<n {
            if i < 2 {
                print(i," ", terminator:"")
            }else {
                let result = first + next
                first = next
                next = result
                print(result," ", terminator:"")
            }
        }
    }
    
    public class func recursive(sum:Int,last:Int,n:Int) {
        print(last," ", terminator:"")
        let newSum = sum + last
        if (n >= 2) {
            recursive(sum: newSum, last: sum, n: n-1)
        }
    }
}

print("Recursion")
Fibonacci.recursive(sum: 1, last: 0, n: 10)
print()
print()
print("Loop")
Fibonacci.loop(n: 10)
