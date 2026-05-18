import SwiftUI

struct HistoryView: View {
    let historyData: [MonthlyHistory]
    var body: some View{
        NavigationView{
            ZStack{
                AppBackground()
                ScrollView{
                    VStack{
                        OverallHistoryView(historyData: historyData)
                    }
                }
                .navigationTitle("History")
                .toolbarTitleDisplayMode(.inlineLarge)
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
        }
    }
}


#Preview {
    HistoryView(historyData: MonthlyHistory.groupedDummy)
}
