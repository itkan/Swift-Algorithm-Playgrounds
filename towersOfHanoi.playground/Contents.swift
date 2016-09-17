/*
 Towers of Hanoi.
 
 You are given a set of three pegs and n disks,
 with each disk a different size. Let's name the pegs A, B, and C,
 and let's number the disks from 1, the smallest disk, to n,
 the largest disk. At the outset, all n disks are on peg A,
 in order of decreasing size from bottom to top,
 so that disk n is on the bottom and disk 1 is on the top.
 The goal is to move all n disks from peg A to peg B.
 
 Rules:
 1. You may move only one disk at a time.
 2. No disk may ever rest atop a smaller disk.
*/

public class TowersOfHanoi {
    public class func process(disks:Int,from:String,to:String,aux:String) {
        if disks == 1 {
            print("Move disk 1 from rod \(from) to rod \(to)")
        }else {
            process(disks: disks-1, from: from, to: aux, aux: to)
            print("Move disk \(disks) from rod \(from) to rod \(to)")
            process(disks: disks-1, from: aux, to: to, aux: from)
        }
    }
}

TowersOfHanoi.process(disks: 4, from: "A", to: "C", aux: "B")
