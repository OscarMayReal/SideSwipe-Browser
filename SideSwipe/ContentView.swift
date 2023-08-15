//
//  ContentView.swift
//  SideSwipe
//
//  Created by oscar may on 14/08/2023.
//

import SwiftUI

struct tab: Identifiable{
    var name: String
    var url: URL
    var ind: Int
    var id = UUID()
}

var opentabs: [tab] = [
    tab(name: "Google", url: URL(string: "https://www.google.com")!, ind: 0),
    tab(name: "Twitter", url: URL(string: "https://www.twitter.com.com")!, ind: 1)
]

struct ContentView: View {
    @State private var searchText = ""
    @State private var showingPopover = false
    @ObservedObject var reloadViewHelper = ReloadViewHelper()
    var body: some View {
        NavigationView{
            List {
                Section {
                    NavigationLink {
                        BookmarksView()
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
                    ForEach(opentabs) { current in
                        NavigationLink {
                            BrowserView(current: current)
                        } label: {
                            Label(current.name, systemImage: "globe")
                        }
                        .swipeActions {
                            Button("Archive") {
                                var lent = opentabs.firstIndex(where: { current.name == $0.name })
                                print(current.ind)
                                opentabs.remove(at: lent!)
                                reloadViewHelper.reloadView()
                            }
                            .tint(.yellow)
                        }
                    }
                } header: {
                    Text("Tabs")
                }
            }
            .navigationTitle("SideSwipe")
            .searchable(text: $searchText, prompt: "Search The Web")
            .refreshable {
                showingPopover = true
            }
        }
        .sheet(isPresented: $showingPopover) {
            NavigationView {
                Text("Hello")
                .navigationTitle("Vault")
                .toolbar {
                                ToolbarItem {
                                    Button {
                                    } label: {
                                        Image(systemName: "plus")
                                    }
                                }
                                ToolbarItem {
                                    Button {
                                    } label: {
                                        Image(systemName: "globe")
                                    }
                                }
                            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ReloadViewHelper: ObservableObject {
    func reloadView() {
        objectWillChange.send()
    }
}
