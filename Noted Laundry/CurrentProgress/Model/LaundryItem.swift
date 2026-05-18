import Foundation
import SwiftData

@Model
final class LaundryItem {
    @Attribute(.unique) var id : UUID
    var name: String
    var isCheck: Bool
    var category: String
    
    var progress: CurrentProgress?
    
    init(id: UUID = UUID(), name: String, isCheck: Bool, category: String) {
        self.id = id
        self.name = name
        self.isCheck = isCheck
        self.category = category
    }
}
