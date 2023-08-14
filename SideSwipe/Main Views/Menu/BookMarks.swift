import SwiftUI

struct BookmarksView: View {
    @State private var searchText = ""
    var body: some View {
        List{
            NavigationLink {
                BookmarksView()
            } label: {
                Label("X", systemImage: "globe")
            }
        }
        .navigationTitle("Bookmarks")
        .searchable(text: $searchText, prompt: "Search Bookmarks")
        .toolbar {
                        ToolbarItem {
                            Button {
                            } label: {
                                Text("Edit")
                            }
                        }
                        ToolbarItem {
                            Button {
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
    }
}

struct Bookmarks_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
