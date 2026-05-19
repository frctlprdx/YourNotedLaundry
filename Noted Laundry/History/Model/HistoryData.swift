import Foundation
import SwiftData

@Model

final class HistoryData {
    @Attribute(.unique) var id: UUID
    var date: String
    var totalCounts: Int
    
    var monthlyHistory: MonthlyHistory?
    
    init(id: UUID, date: String, totalCounts: Int, monthlyHistory: MonthlyHistory? = nil) {
        self.id = id
        self.date = date
        self.totalCounts = totalCounts
        self.monthlyHistory = monthlyHistory
    }
}
