import SwiftUI
internal import Combine

struct CardBackground: View {
    var clothesData: [AddLaundry] = AddLaundry.clothesData
    @State private var tick = 0
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    // 1. Buat State untuk menyimpan posisi dan rotasi yang tetap
    @State private var itemPositions: [UUID: CGPoint] = [:]
    @State private var itemRotations: [UUID: Double] = [:]

    var body: some View {
        ZStack(alignment: .topLeading){
            ForEach(clothesData) { data in
                Image(data.clothName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(x: itemPositions[data.id]?.x ?? 0,
                            y: itemPositions[data.id]?.y ?? 0)
                    .rotationEffect(.degrees(itemRotations[data.id] ?? 0))
                    .animation(.easeInOut(duration: 3), value: tick)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .clipped()
        .onAppear {
            setupInitialPositions()
        }
        .onReceive(timer) { _ in
            updatePositions()
            tick += 1
        }
    }

    // Fungsi untuk menset posisi awal
    private func setupInitialPositions() {
        for data in clothesData {
            itemPositions[data.id] = CGPoint(x: CGFloat.random(in: 0..<230),
                                             y: CGFloat.random(in: 0..<230))
            itemRotations[data.id] = Double.random(in: -45...45)
        }
    }

    private func updatePositions() {
        for data in clothesData {
            itemPositions[data.id] = CGPoint(x: CGFloat.random(in: 0..<230),
                                             y: CGFloat.random(in: 0..<230))
            itemRotations[data.id] = Double.random(in: -45...45)
        }
    }
}

#Preview {
    CardBackground()
}
