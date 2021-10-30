import SwiftUI

struct SegmentedView: View {
    @State var selection: Int = 0
    
    let childViews: [String: Text] = ["1": Text("View 1"),
                                      "2": Text("View 2")]
    lazy var keys: [String] = { childViews.keys.sorted() }()
    
    var body: some View {
        Picker("Picker", selection: $selection) {
            ForEach(childViews.keys.sorted(), id: \.self) { key in
                Text(key)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        let key = childViews.keys.sorted()[selection]
        childViews[key]
    }
}
