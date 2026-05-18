import SwiftUI

extension View {
    func carousel(at position: Int, in total: Int) -> some View {
        // Posisi 0 adalah kartu paling depan
        // Semakin besar position, semakin ke belakang dan semakin kecil
        let scale = 1.0 - (Double(position) * 0.05)
        let yOffset = Double(position) * 15.0
        let xOffset = Double(position) * 10.0
        
        return self
            .scaleEffect(scale)
            .offset(x: xOffset, y: yOffset)
            // Kartu yang terlalu jauh di belakang disembunyikan saja agar tidak berat
            .opacity(position > 3 ? 0 : 1.0)
    }
}
