import Foundation

struct ClothesData: Identifiable, Codable{
    var id = UUID()
    let name: String
    
    static let dummyClothes = [
        ClothesData(name: "T-Shirts"),
        ClothesData(name: "Shorts"),
        ClothesData(name: "Pants"),
        ClothesData(name: "Shoes"),
        ClothesData(name: "Socks"),
        ClothesData(name: "Jackets")
    ]
    
}


