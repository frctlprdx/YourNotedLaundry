import SwiftUI

struct AllItems: View {
    @Binding var clothesData: [AddLaundry]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

        var body: some View {
             ScrollView {
                 LazyVGrid(columns: columns, alignment: .center) {
                     ForEach($clothesData) { $data in
                         ClothesCard(name: data.clothName, countValue: $data.clothCount)
                     }
                 }
             }
        }
}
