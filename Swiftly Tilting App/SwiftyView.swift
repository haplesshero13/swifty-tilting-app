import SwiftUI

let fruits = ["Apples", "Oranges", "Bananas", "Pears", "Mangos", "Grapefruit"]
let imageURL = URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/tFnTds88mCuLcLPBseK1kF2E3qv.jpg")!

struct SwiftyView: View {
    @State var items: [String] = fruits
    @State var selections: [String] = []
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        VStack {
            Text("SwiftyView").font(.system(size: 36))
            Text("Written in SwiftUI").font(.system(size: 14))
            List {
                ImageFromURL(
                    url: imageURL
                )
                Text("Select all that apply").font(.system(size: 14))
                ForEach(self.items, id: \.self) { item in
                    MultipleSelectionRow(title: item, isSelected: self.selections.contains(item)) {
                        if self.selections.contains(item) {
                            self.selections.removeAll(where: { $0 == item })
                        }
                        else {
                            self.selections.append(item)
                        }
                    }
                }
            }
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct SwiftyView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftyView(items: fruits, selections: ["Bananas", "Mangos"])
    }
}
