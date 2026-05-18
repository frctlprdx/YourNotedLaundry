import SwiftUI

struct ListDetail: View {
    @State var isCheck: Bool
    var name: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "tshirt.fill")
                    .font(.headline.bold())
                    .padding(8)
                    .background(.secondary)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.1), radius: 5)
                Text(name)
                    .font(.footnote)
                Spacer()
                Button {
                    isCheck.toggle()
                } label: {
                    Image(systemName: isCheck ? "checkmark.seal" : "circle")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(isCheck ? Color.primary : Color.secondary)
                }
                .foregroundStyle(.secondary)
                
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("DeepAzure"))
            }
            .shadow(color: Color.black.opacity(0.3), radius: 10, x:0 , y: 10)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}
#Preview {
    // Preview diletakkan di atas background gelap/terang untuk simulasi
    ZStack {
        Color.gray.opacity(0.1).ignoresSafeArea()
        VStack {
            ListDetail(isCheck: true, name: "Kemeja Putih")
            ListDetail(isCheck: false, name: "Kaos Hitam")
        }
    }
}
