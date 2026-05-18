import SwiftUI

struct AppBackground: View {
    var body: some View {
        LinearGradient(
                    colors: [Color("DeepAzure"), Color("GlassMint")],
                    startPoint: .bottom,
                    endPoint: .top
                ).ignoresSafeArea() // Agar gradient memenuhi seluruh layar hingga status bar
    }
}
