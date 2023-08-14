//
//  ContentView.swift
//  SideSwipe
//
//  Created by oscar may on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
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
            .searchable(text: $searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
