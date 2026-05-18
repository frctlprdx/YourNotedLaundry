import SwiftUI

struct OverallHistoryView: View {
    let historyData: [MonthlyHistory]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(historyData) { monthGroup in
                    Group {
                        let items = monthGroup.items
                        Text(monthGroup.monthName)
                            .font(.title2.bold())
                            .padding(.horizontal)

                        ZStack(alignment: .top) {
                            ForEach(Array(items.enumerated()), id: \.element.id) { index, data in
                                RandomHistoryCard(data: data, index: index, totalCount: items.count)
                            }
                        }
                        .padding(.bottom, CGFloat((items.count - 1) * 40))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
        }
    }
}
