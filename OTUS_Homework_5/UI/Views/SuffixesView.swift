import SwiftUI

struct SuffixesView: View {
    
    let viewModel: DetailViewModel
    
    @State var selection: Int = 0
    private let segments = ["A-Z", "Z-A"]
    
    var body: some View {
        List {
            Picker("Picker", selection: $selection) {
                ForEach(Array(zip(segments.indices, segments)), id: \.0) { index, key in
                    Text(key).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            let suffixes = selection == 0 ? viewModel.suffixTuples : viewModel.suffixTuples.reversed()
            
            ForEach(suffixes, id: \.0) { tuple in
                Text("\(tuple.0) - '\(tuple.1)'")
            }
        }
    }
}

struct SuffixesView_Previews: PreviewProvider {
    static var previews: some View {
        SuffixesView(viewModel: DetailViewModel(text: "Hello world"))
    }
}
