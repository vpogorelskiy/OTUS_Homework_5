struct SuffixArray: Sequence {
    let string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string)
    }
}

struct SuffixIterator: IteratorProtocol {
    var current: String.SubSequence?
    init(_ string: String) {
        self.current = string.lowercased().suffix(from: string.startIndex)
    }

    mutating func next() -> String.SubSequence? {
        guard let thisCurrent = current,
                thisCurrent.count > 0 else { return nil }
        let index = thisCurrent.index(thisCurrent.startIndex, offsetBy: 1)
        current = thisCurrent.suffix(from: index)
        return thisCurrent
    }
}

extension String {
    func suffixArray() -> [Substring] {
        return SuffixArray(self).sorted()
    }
}
