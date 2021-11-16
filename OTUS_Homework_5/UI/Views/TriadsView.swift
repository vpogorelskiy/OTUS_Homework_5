import SwiftUI

struct TriadsView: View {
    
    let viewModel: SuffixViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.topTriads, id: \.self) { triad in
                Text(triad)
            }
        }
    }
}

struct TriadsView_Previews: PreviewProvider {
    static var previews: some View {
        TriadsView(viewModel: SuffixViewModel())
    }
}
