import SwiftUI

struct DetailView: View {
    
    let viewModel: DetailViewModel
    
    @State var selection: Int = 0
    
    var body: some View {
        SegmentedView(childViews: ["Suffix stats" : AnyView(Text("Suffix stat view")),
                                   "Top triads": AnyView(Text("Triads view"))])
        .navigationTitle("Suffixes")
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(text: "Hello world"))
    }
}
