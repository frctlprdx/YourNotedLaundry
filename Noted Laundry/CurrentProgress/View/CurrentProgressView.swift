import SwiftUI
import SwiftData

struct CurrentProgressView: View {
    @Query private var progressData: [CurrentProgress]
    var body: some View {
        NavigationStack{
            ZStack(){
                AppBackground()
                ListOfCard(currentData: progressData)
            }
            .navigationTitle("Welcome, ")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar{
                progressData.isEmpty ? nil :
                ToolbarItem {
                    NavigationLink {
                        AddLaundryView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
