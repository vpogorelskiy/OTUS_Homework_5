struct HeistoryViewModel {
    let textHistory: [String]

    init() {
        textHistory = WordCache().getLastUsed()
    }
}

