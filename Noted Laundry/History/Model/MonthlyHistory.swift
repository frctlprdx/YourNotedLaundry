import Foundation
import SwiftData

@Model
final class MonthlyHistory {
    @Attribute(.unique) var id: UUID
    var monthName: String
    
    @Relationship(deleteRule:.cascade, inverse: \HistoryData.monthlyHistory)
    var items: [HistoryData] = []
    
    init(id: UUID, monthName: String, items: [HistoryData]) {
        self.id = id
        self.monthName = monthName
        self.items = items
    }
}
