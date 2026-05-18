import SwiftUI

struct ListOfCard: View {
    let currentData: [CurrentProgress]
    var body: some View {
        ZStack{
            if currentData.isEmpty{
                VStack(spacing: 20) {
                    Image(systemName: "tray.and.arrow.down")
                        .font(.system(size: 60))
                        .foregroundStyle(.secondary.opacity(0.7))
                        .padding(.bottom, 10)
                    
                    Text("No Current Laundry Active")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)

                    NavigationLink {
                        AddLaundryView()
                    } label: {
                        Text("Add Laundry Now")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color("BubbleCoral"))
                            .clipShape(Capsule())
                    }
                    .padding(.top, 10)
                }
                .transition(.opacity.combined(with: .scale))
            } else {
                ForEach(Array(currentData.enumerated()), id: \.element.id){ index, progress in
                    ProgressCard(progressData: progress)
                        .stacked(at: index, in: currentData.count)
                        .animation(.linear(duration: 0.1), value: currentData.count)
                }
            }
        }
    }
}

