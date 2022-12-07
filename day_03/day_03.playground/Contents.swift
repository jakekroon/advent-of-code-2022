import Cocoa

let fileURL = Bundle.main.url(forResource: "day_03", withExtension: "input")
let puzzleInput = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8).trimmingCharacters(in: .whitespacesAndNewlines)

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

func calcItemValue(item: UInt8) -> UInt8 {
    if (item <  97) {
        return item - 38
    }

    return item - 96
}

let q1 = puzzleInput.split(separator: "\n").map { (rucksack) -> Int in
    let items = Array(rucksack)
    let firstCompartment = Set(items[0...(items.count / 2 - 1)])
    let secondCompartment = Set(items[(items.count / 2)...(items.count - 1)])
    let commonItem = Array(firstCompartment.intersection(secondCompartment))[0]

    return Int(calcItemValue(item: commonItem.asciiValue!))
}.reduce(0, +)

let q2 = puzzleInput.split(separator: "\n").chunked(into: 3).map { (elves) -> Int in
    let itemsByElf = elves.map({ Array($0).map { $0.asciiValue } })
    let commonItem = Array(itemsByElf.reduce(Set(itemsByElf.first!)) { (result, elf) in
        result.intersection(Set(elf))
    })[0]

    return Int(calcItemValue(item: commonItem!))
}.reduce(0, +)
