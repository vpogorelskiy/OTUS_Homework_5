import SwiftUI

struct DetailView: View {
    
    let viewModel: DetailViewModel
    
    var body: some View {
        SegmentedView(childViews: ["Suffix stats" : AnyView(SuffixesView(viewModel: viewModel)),
                                   "Top triads": AnyView(Text("Triads view"))])
        .navigationTitle("Suffixes")
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(text: "Hello world"))
    }
}
