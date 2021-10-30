import SwiftUI

struct DetailView: View {
    
    @State var inputText: String
    
    
    init(inputText: String) {
        print("\(Self.self).\(#function)")
        self.inputText = inputText
    }
    
    var body: some View {
        VStack {
            Text(inputText)
        }
        .navigationTitle("Suffixes")
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(inputText: "Hello world")
    }
}
