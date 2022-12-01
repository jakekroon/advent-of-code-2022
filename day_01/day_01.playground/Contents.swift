import Cocoa

let fileURL = Bundle.main.url(forResource: "day_01", withExtension: "input")
let puzzleInput = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8).trimmingCharacters(in: .whitespacesAndNewlines)

// part one
let mostCalories = puzzleInput.components(separatedBy: "\n\n").map { (elf) -> Int in
    return elf.components(separatedBy: "\n").map { Int($0)! }.reduce(0, +)
}.max()

// part two
let totalCalories = puzzleInput.components(separatedBy: "\n\n").map { (elf) -> Int in
    return elf.components(separatedBy: "\n").map { Int($0)! }.reduce(0, +)
}.sorted(by: >)[0...2].reduce(0, +)
