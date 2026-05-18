import SwiftUI

struct DetailCard: View {
    var name: String
    var count: Int
    var onSwipe: () -> Void 
    
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name).font(.title).bold()
                Spacer()
                Image(name)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(8)
                    .background(Circle().fill(Color.white.opacity(0.2)))
            }
            Divider()
            ScrollView { // Gunakan ScrollView agar jika item banyak tidak overflow
                VStack(spacing: 12) {
                    ForEach(0..<count, id: \.self) { index in
                        TextField("Item \(index + 1)", text: .constant(""))
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.ultraThinMaterial))
                    }
                }
            }
        }
        .padding()
        .frame(width: 300, height: 500)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color("DeepAzure"))
                .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 15)
        }
        .offset(x: dragOffset)
        .rotationEffect(.degrees(Double(dragOffset / 15))) // Efek miring sedikit saat digeser
        .gesture(
            DragGesture()
                .onChanged({ dragOffset = $0.translation.width })
                .onEnded { gesture in
                    if abs(dragOffset) > 150 {
                        // Animasi lempar keluar
                        withAnimation(.spring()) {
                            dragOffset = dragOffset > 0 ? 1000 : -1000
                        }
                        
                        // Tunggu animasi selesai, lalu pindahkan data di Parent
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            onSwipe()
                            dragOffset = 0 // Reset posisi untuk kartu ini saat muncul lagi di belakang
                        }
                    } else {
                        withAnimation(.spring()) { dragOffset = 0 }
                    }
                }
        )
    }
}
