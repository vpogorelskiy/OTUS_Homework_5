import SwiftUI

struct SegmentedView: View {
    let childViews: [String: AnyView]
    
    @State private var selection: Int = 0
    
    private let keys: [String]
    
    init(childViews: [String: AnyView]) {
        self.childViews = childViews
        self.keys = childViews.map{$0.key}.sorted()
    }
    
    var body: some View {
        VStack() {
            Picker("Picker", selection: $selection) {
                ForEach(Array(zip(keys.indices, keys)), id: \.0) { index, key in
                    Text(key).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            let key = childViews.keys.sorted()[selection]
            Divider()
            ScrollView {
                childViews[key]
            }
        }
        
    }
}

struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView(childViews: ["1": AnyView(Text("View 1")),
                                   "2": AnyView(Text("View 2"))])
    }
}
