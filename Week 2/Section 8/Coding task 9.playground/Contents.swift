import Foundation

//Don't change this
var studentsAndScores = ["Amy": Int(readLine()!)!, "James": Int(readLine()!)!, "Helen": Int(readLine()!)!]

func highestScore(scores: [String: Int]) {
    //Write your code here.
    guard let maxScore = studentsAndScores.values.max() else { return }
    print(maxScore)
}

