import Foundation
import SwiftData

@Model
final class CurrentProgress {
    var countdown: String
    
    @Relationship(deleteRule: .cascade, inverse: \LaundryItem.progress)
    var items: [LaundryItem] = []
    
    init(countdown: String, currentCount: Int, maxCount: Int, items: [LaundryItem]) {
        self.countdown = countdown
        self.items = items
    }
}
