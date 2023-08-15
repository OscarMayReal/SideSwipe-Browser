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
                    ForEach(opentabs) { tab in
                        TabItem(current: tab)
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

struct TabItem: View {
    let current: tab
    var body: some View {
        NavigationLink {
            BrowserView(current: current)
        } label: {
            Label(current.name, systemImage: "globe")
        }
        .swipeActions {
            Button("Archive") {
                var lent = current.ind
                print(current.ind)
            }
            .tint(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
