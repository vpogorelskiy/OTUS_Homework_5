import SwiftUI

struct SuffixesView: View {
    
    @ObservedObject var viewModel: SuffixViewModel
    
    @State var selection: Int = 0
    private let segments = ["A-Z", "Z-A"]
    
    var body: some View {
        List {
            TextField("Search", text: $viewModel.searchText)
            Picker("Picker", selection: $selection) {
                ForEach(Array(zip(segments.indices, segments)), id: \.0) { index, key in
                    Text(key).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            let suffixes = selection == 0 ? viewModel.suffixes : viewModel.suffixes.reversed()
            
            ForEach(suffixes, id: \.suffix) { item in
                Text("\(item.suffix) - '\(item.count)'")
            }
        }
    }
}

struct SuffixesView_Previews: PreviewProvider {
    static var previews: some View {
        SuffixesView(viewModel: SuffixViewModel(text: Constants.mockText))
    }
}
