import SwiftUI

struct AddLaundryView: View{
    @State private var clothesData: [AddLaundry] = AddLaundry.clothesData
    var hasSelectedItems: Bool {
        // Cek apakah ada setidaknya satu item yang count-nya > 0
        clothesData.contains { $0.clothCount > 0 }
    }
    var body: some View {
        NavigationStack{
            ZStack{
                AppBackground()
                VStack{
                    AllItems(clothesData: $clothesData).padding(.horizontal,8)
                }
            }
            
            .navigationTitle("Add Notes")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar{
                NavigationLink(destination: {
                    DetailList(items: clothesData)
                }, label: {
                    Image(systemName: "arrow.right")
                })
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.circle)
                .disabled(!hasSelectedItems)
            }
        }
    }
}

#Preview {
    AddLaundryView()
}
