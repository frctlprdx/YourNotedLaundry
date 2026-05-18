import Foundation

struct MonthlyHistory: Identifiable, Codable {
    var id = UUID()
    let monthName: String
    let items: [HistoryData]
    
    static let groupedDummy = [
        MonthlyHistory(monthName: "April", items: [
            HistoryData(id: 1, date: "16 April 2026", totalCounts: 15),
            HistoryData(id: 2, date: "17 April 2026", totalCounts: 11)
        ])
    ]
}

struct HistoryData: Identifiable, Codable {
    let id: Int
    let date: String
    let totalCounts: Int
}

