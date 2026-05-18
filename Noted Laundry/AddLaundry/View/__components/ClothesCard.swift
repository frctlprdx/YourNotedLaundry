import SwiftUI

struct ClothesCard: View {
    var name: String?
    @Binding var countValue: Int
    
    var body : some View {
        VStack{
            if let name = name{
                Text(name).padding(.top)
            } else {
                Text("Unknown Clothes").padding(.top)
            }
            // Area Gambar
            ZStack {
                Color.clear
                if let imageName = name {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(25)
                } else {
                    Image(systemName: "socks.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(35)
                        .foregroundStyle(.tertiary)
                }
            }
            .aspectRatio(1, contentMode: .fit)
            
            Spacer()
            
            // Area Kontrol yang Lebih Refined
            HStack(spacing: 12) {
                // Tombol Minus
                controlButton(systemName: "minus") {
                    if countValue > 0 { countValue -= 1 }
                }
                
                // Input Angka
                TextField("0", value: $countValue, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .font(.system(.title3, design: .rounded).bold())
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)
                
                // Tombol Plus
                controlButton(systemName: "plus") {
                    countValue += 1
                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 220)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 4)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(.white.opacity(0.4), lineWidth: 1)
        }
    }
    
    // Helper View untuk tombol kontrol
    @ViewBuilder
    func controlButton(systemName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.primary)
                .frame(width: 36, height: 36)
                .background(Circle().fill(.white.opacity(0.2)))
        }
        .buttonStyle(.plain)
    }
}
