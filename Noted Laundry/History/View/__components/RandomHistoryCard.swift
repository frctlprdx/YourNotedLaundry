import SwiftUI

struct RandomHistoryCard: View {
    let data: HistoryData
    let index: Int
    let totalCount: Int

    func getGradient(_ index: Int) -> LinearGradient {
        let colors: [Color] = [.blue, .purple, .black, .indigo]
        let color = colors[index % colors.count]
        return LinearGradient(colors: [color.opacity(0.8), color], startPoint: .top, endPoint: .bottom)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(data.date)
                .foregroundStyle(.white)
                .font(.title3)
                .bold()
            
            Spacer()
            
            Text("Total Items : \(data.totalCounts)")
                .foregroundStyle(.white.opacity(0.8))
                .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 200)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(getGradient(index))
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
        // Offset berdasarkan index untuk efek Wallet
        .offset(y: CGFloat(index * 40))
        // Gunakan totalCount yang dioper dari parent
        .scaleEffect(1.0 - CGFloat(totalCount - 1 - index) * 0.02)
        .zIndex(Double(index))
    }
}
