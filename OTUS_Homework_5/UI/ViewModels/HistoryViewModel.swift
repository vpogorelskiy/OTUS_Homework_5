struct HistoryViewModel {
    let textHistory: [String]

    init() {
        textHistory = WordCache().getLastUsed()
    }
}

