struct DetailViewModel {
    let suffixTuples: [(String, Int)]
    let topTriads: [String]
    
    
    init(text: String) {
        let suffixes = text.suffixArray()
        let suffixDict = suffixes.reduce(into: [Substring:Int]()) { partialResult, suffix in
            let count = partialResult[suffix] ?? 0
            partialResult[suffix] = count + 1
        }
        
        suffixTuples = suffixDict.keys.sorted().reduce(into: [(String, Int)](), { partialResult, suffix in
            partialResult.append((String(suffix), suffixDict[suffix] ?? 0))
        })
        
        topTriads = suffixDict.filter{ $0.key.count == 3 }
                            .sorted(by: { $1.key > $0.key })
                            .prefix(10)
                            .map{ String($0.key) }
        
        WordCache().addText(string: text)
    }
}

