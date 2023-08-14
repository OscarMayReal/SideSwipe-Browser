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
    var id = UUID()
}

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
                    TabItem()
                    TabItem()
                    TabItem()
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
    var body: some View {
        NavigationLink {
            
        } label: {
            Label("Google", systemImage: "globe")
        }
        .swipeActions {
            Button("Archive") {
                print("Awesome!")
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
