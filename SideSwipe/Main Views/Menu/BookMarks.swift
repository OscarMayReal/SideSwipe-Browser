import SwiftUI

struct BookmarksView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            List {
                Section {
                    NavigationLink {
                        
                    } label: {
                        Label("Bookmarks", systemImage: "star")
                    }
                    NavigationLink {
                        
                    } label: {
                        Label("history", systemImage: "clock")
                    }
                } header: {
                    Text("Browser")
                }
                Section{
                    NavigationLink {
                        
                    } label: {
                        Label("X", systemImage: "globe")
                    }
                    NavigationLink {
                        
                    } label: {
                        Label("Google", systemImage: "globe")
                    }
                } header: {
                    Text("Tabs")
                }
            }
            .navigationTitle("SideSwipe")
            .searchable(text: $searchText, prompt: "Search The Web")
        }
    }
}

struct Bookmarks_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
