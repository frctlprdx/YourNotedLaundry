import SwiftUI

struct ProgressCard: View {
    let progressData: CurrentProgress
    
    @State private var isOpen: Bool = false
    @State private var offset = CGSize.zero
    @State private var warning: Bool = false
    
    var totalClothes: Int {
        progressData.items.count
    }
    
    var doneClothes: Int {
        progressData.items.filter {$0.isCheck}.count
    }
    
    func progress(current: Int, max: Int) -> Double {
        guard max > 0 else { return 0 }
        return Double(current)/Double(max)
        
    }
    
    var body: some View {
        VStack{
            ZStack (alignment: .bottom){
                Color("HighlightColor")
                VStack{
                    CardBackground()
                }
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)
                if warning {
                    HStack{
                        VStack{
                            Image(systemName: "hand.draw.fill")
                                .foregroundStyle(Color.black)
                                .font(.title3)
                                .bold()
                            Text("Swipe Up to Delete")
                                .foregroundStyle(Color.black)
                                .font(.title3)
                                .bold()
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity)
                    .animation(.smooth)
                    .overlay(content: {
                        Color.black.opacity(0.2)
                    })
                }
                VStack{
                    ProgressView(value: progress(current: doneClothes, max: totalClothes))
                        .tint(Color.pink)
                        .padding(.bottom)
                    HStack{
                        Button {
                            isOpen.toggle()
                        } label: {
                            Text("Click Here For Detail")
                                .padding(8)
                                .font(.title3)
                                .foregroundStyle(Color.glassMint)
                                .bold()
                                .background{
                                    Capsule()
                                        .tint(Color("ElectricBlue"))
                                }
                        }

                        Spacer()
                        Text(progressData.countdown)
                            .foregroundStyle(Color("BubbleCoral"))
                            .padding(10)
                            .font(.subheadline)
                            .background{
                                Capsule()
                                    .fill(Color("BubbleCoral").opacity(0.2))
                            }
                        
                    }
                    
                }
                
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 100)
                .background{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding()
        .shadow(color: Color.black.opacity(0.3), radius: 20)
        .offset(x: offset.width, y: offset.height)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .gesture(
            DragGesture()
                .onChanged { value in
                    offset = value.translation
                    warning = true
                }
                .onEnded { value in
                    if abs(offset.height) != 0 && abs(offset.width) != 0{
                        offset = .zero
                        warning = false
                    } else {
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
                }
        )
        .sheet(isPresented: $isOpen) {
            CurrentDetail(progressData: progressData)
        }
    }
}
