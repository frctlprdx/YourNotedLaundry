import SwiftUI
import SwiftData

struct HistoryView: View {
    @Query private var  historyData: [MonthlyHistory]
    var body: some View{
        NavigationStack{
            ZStack{
                AppBackground()
                if historyData.isEmpty {
                    ContentUnavailableView {
                        Label("No History Available", systemImage: "clock.badge.exclamationmark")
                    } description: {
                        Text("Your completed laundry sessions will appear here once they are finished.")
                            .font(.subheadline)
                    } actions: {
                        // Tombol pemanis atau bisa diarahkan untuk kembali ke Home jika mau
                        NavigationLink(destination: {
                            AddLaundryView()
                        }, label: {
                            Text("Start Laundry Now")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(Color("BubbleCoral")) // Menggunakan Accent Color-mu
                                .clipShape(Capsule())
                        })
                        .padding(.top, 10)
                    }
                    // Memberikan efek transisi halus saat data beralih dari kosong ke ada
                    .transition(.opacity.combined(with: .scale))
                } else {
                    ScrollView{
                        VStack{
                            OverallHistoryView(historyData: historyData)
                        }
                    }
                }
                
//                .toolbar{
//                    ToolbarItemGroup(placement: .navigationBarTrailing) {
//                        Menu {
//                            Picker(selection: .constant(1), content: {
//                                Label {
//                                    Text("View As List")
//                                } icon: {
//                                    Image(systemName: "list.bullet")
//                                }.tag(1)
//                            }, label: {
//                                Text("Picker")
//                            })
//                            
//                            Button {
//                                //
//                            } label: {
//                                Label {
//                                    Text("Sort By")
//                                } icon: {
//                                    Image(systemName: "arrow.up.arrow.down")
//                                }
//                                
//                            }
//                            Button {
//                                //
//                            } label: {
//                                Label {
//                                    Text("Group By")
//                                } icon: {
//                                    Image(systemName: "calendar")
//                                }
//                                
//                            }
//                        } label: {
//                            Image(systemName: "ellipsis")
//                        }
//                    }
//                }
                
            }
            .navigationTitle("History")
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}
