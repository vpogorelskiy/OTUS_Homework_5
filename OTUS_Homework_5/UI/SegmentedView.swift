import SwiftUI

struct SegmentedView: View {
    let childViews: [String: AnyView]
    
    @State private var selection: Int = 0
    
    private lazy var keys: [String] = { childViews.keys.sorted() }()
    
    init(childViews: [String: AnyView]) {
        self.childViews = childViews
    }
    
    var body: some View {
        VStack() {
            Picker("Picker", selection: $selection) {
                ForEach(childViews.keys.sorted(), id: \.self) { key in
                    Text(key)
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
