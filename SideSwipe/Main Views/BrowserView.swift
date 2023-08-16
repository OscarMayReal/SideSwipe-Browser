//
//  BrowserView.swift
//  SideSwipe
//
//  Created by oscar may on 14/08/2023.
//

import SwiftUI
import WebView
struct BrowserView: View {
    @StateObject var webViewStore = WebViewStore()
    @State private var searchText = ""
    var current: tab
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle(current.name)
            .searchable(text: $searchText, prompt: "Enter a URL")
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView(current: tab(name: "String", url: URL(string: "https://www.google.com")!))
    }
}

