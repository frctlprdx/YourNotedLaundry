import Foundation

struct AddLaundry: Codable, Identifiable {
    var id = UUID()
    let clothName: String
    var clothCount: Int
    
    static let clothesData: [AddLaundry] = [
        AddLaundry(clothName: "T-shirts", clothCount: 0),
        AddLaundry(clothName: "Jackets", clothCount: 0),
        AddLaundry(clothName: "Pants", clothCount: 0),
        AddLaundry(clothName: "Shoes", clothCount: 0),
        AddLaundry(clothName: "Shorts", clothCount: 0),
        AddLaundry(clothName: "Socks", clothCount: 0)
    ]
}
