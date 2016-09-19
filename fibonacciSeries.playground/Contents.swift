/*
 Fibonacci Series
 
 Fibonacci Series generates subsequent number by adding two previous numbers.
 
 Fn = Fn-1 + Fn-2
 
 The initial values of F0 & F1 to be taken as 0, 1
 
 Check: Loop is more efficient than recursion in case of Fibonacci
*/

public class Fibonacci {
    public class func recursive(n:Int) {
        for i in 0..<n {
            print(Fibonacci.calculate(n: i))
        }
    }
    
    public class func calculate(n:Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }else {
            return (calculate(n: n-1) + calculate(n: n-2))
        }
    }
    
    public class func loop(n:Int) {
        var first = 0, next = 1
        
        for i in 0..<n {
            if i < 2 {
                print(i)
            }else {
                let result = first + next
                first = next
                next = result
                print(result)
            }
        }
    }
}

print("Recursion")
Fibonacci.recursive(n: 10)
print()
print()
print("Loop: Efficient")
Fibonacci.loop(n: 10)
