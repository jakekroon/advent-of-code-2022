import Cocoa

let fileURL = Bundle.main.url(forResource: "day_02", withExtension: "input")
let puzzleInput = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8).trimmingCharacters(in: .whitespacesAndNewlines)

struct Rule {
    let points: Int
    let beats: String
    let draws: String
    let loses: String
}

let rules = [
    "X": Rule(points: 1, beats: "C", draws: "A", loses: "B"),
    "Y": Rule(points: 2, beats: "A", draws: "B", loses: "C"),
    "Z": Rule(points: 3, beats: "B", draws: "C", loses: "A"),
    "A": Rule(points: 1, beats: "Z", draws: "X", loses: "Y"),
    "B": Rule(points: 2, beats: "X", draws: "Y", loses: "Z"),
    "C": Rule(points: 3, beats: "Y", draws: "Z", loses: "X"),
]

func determinePoints(player1: String, player2: String) -> Int {
    if (rules[player2]!.beats == player1) {
        return rules[player2]!.points + 6
    } else if (rules[player2]!.draws == player1) {
        return rules[player2]!.points + 3
    }
    
    return rules[player2]!.points
}

let q1 = puzzleInput.split(separator: "\n").map { (game) -> Int in
    let parts = game.split(separator: " ")
    return determinePoints(player1: String(parts[0]), player2: String(parts[1]))
}.reduce(0, +)

func determinePlay(player1: String, outcome: String) -> String {
    if (outcome == "X") {
        return rules[player1]!.beats
    } else if (outcome == "Y") {
        return rules[player1]!.draws
    }

    return rules[player1]!.loses
}

let q2 = puzzleInput.split(separator: "\n").map { (game) -> Int in
    let parts = game.split(separator: " ")
    let play = determinePlay(player1: String(parts[0]), outcome: String(parts[1]))
    return determinePoints(player1: String(parts[0]), player2: play)
}.reduce(0, +)

