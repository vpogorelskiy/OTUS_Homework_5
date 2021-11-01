import SwiftUI

struct TriadsView: View {
    
    let viewModel: DetailViewModel
    
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
        TriadsView(viewModel: DetailViewModel(text: "Hello world"))
    }
}
