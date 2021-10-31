struct DetailViewModel {
    let text: String
    
    var suffixTuples: [(String, Int)] {
        [("bra", 1), ("cad", 2)]
    }
    
    var topTriads: [String] {
        ["abr", "cad", "bra", "abc"].sorted()
    }
}

