import SwiftUI

struct DetailList: View {
    @State private var clothesData: [AddLaundry]
    
    init(items: [AddLaundry]) {
        _clothesData = State(initialValue: items.filter { $0.clothCount > 0 })
    }
    
    func rotateArray() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            if let first = clothesData.first {
                clothesData.removeFirst()
                clothesData.append(first)
            }
        }
    }
    
    var body: some View {
        ZStack {
            AppBackground()
            
            VStack{
                ZStack{
                    ForEach(Array(clothesData.enumerated()), id: \.element.id) { index, item in
                        DetailCard(name: item.clothName, count: item.clothCount) {
                            rotateArray()
                        }
                        .zIndex(Double(clothesData.count - index))
                        .carousel(at: index, in: clothesData.count)
                    }
                }
                Button {
                    // Action
                } label: {
                    Text("Done")
                        .frame(width:150, height: 50)
                }
                .buttonStyle(.glass)
                .padding()
            }
        }
    }
    
    
}

#Preview {
    DetailList(items: [
        AddLaundry(clothName: "T-shirts", clothCount: 6),
        AddLaundry(clothName: "Jackets", clothCount: 6),
        AddLaundry(clothName: "Pants", clothCount: 6),
        AddLaundry(clothName: "Shoes", clothCount: 6),
        AddLaundry(clothName: "Shorts", clothCount: 6),
        AddLaundry(clothName: "Socks", clothCount: 6)
    ])
}
