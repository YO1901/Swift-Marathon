import Foundation

//Don't change this
var aYear =  Int(readLine()!)!

func isLeap(year: Int) {
  //Write your code inside this function.
    if year % 100 == 0, year % 400 == 0 {
        print("YES")
    } else if year % 100 == 0 {
        print("NO")
    } else if year % 4 == 0 {
        print("YES")
    } else {
        print("NO")
    }
}

