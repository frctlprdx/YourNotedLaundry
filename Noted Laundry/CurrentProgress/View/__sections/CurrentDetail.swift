import SwiftUI

struct CurrentDetail: View {
    let progressData: CurrentProgress
    
    var totalClothes: Int {
        progressData.items.count
    }
    
    var doneClothes: Int {
        progressData.items.filter {$0.isCheck}.count
    }
    
    private var groupedItems: [String: [LaundryItem]] {
        Dictionary(grouping: progressData.items, by: {$0.category})
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.primary)
                        .font(.title)
                        .padding(5)
                    
                }
                .buttonStyle(.glass)
                .clipShape(Circle())
                .padding()
                .shadow(color: .black.opacity(0.1), radius: 5)
                
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundStyle(Color.white)
                        .font(.title)
                        .padding(5)
                }
                .buttonStyle(.glassProminent)
                .clipShape(Circle())
                .padding()
                .shadow(color: .black.opacity(0.1), radius: 5)
            }
            
            HStack{
                Text("\(doneClothes)/\(totalClothes) Completed")
                    .bold()
                Spacer()
                Text(progressData.countdown)
                    .foregroundStyle(Color("BubbleCoral"))
                    .padding(10)
                    .font(.subheadline)
                    .background{
                        Capsule()
                            .fill(Color("BubbleCoral").opacity(0.2))
                    }
            }
            .padding(.horizontal)
            Divider()
            
            
            ScrollView{
                LazyVStack(spacing: 16){
                    ForEach(groupedItems.keys.sorted(), id: \.self){ categoryName in
                        Section(header:
                                    HStack{
                            Text(categoryName)
                                .font(.headline)
                                .foregroundStyle(.secondary)
                                .bold()
                            Spacer()
                        }) {
                            if let items = groupedItems[categoryName] {
                                ForEach(items){ item in
                                    ListDetail(isCheck: item.isCheck, name: item.name)
                                }
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
