//
//  ContentView.swift
//  Shapes
//
//  Created by Tim on 06.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                ShapesView().tabItem {
                    Label("Shapes", systemImage: "square.on.square.squareshape.controlhandles")
                }
                AboutView().tabItem {
                    Label("About", systemImage: "info.circle")
                }.navigationTitle("About")
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


struct AboutView: View {
    var body: some View {
        VStack {
            Form {
                Section("Socials") {
                    Link("GitHub (@timi2506)", destination: URL(string: "https://github.com/timi2506")!)
                    Link("Twitter (@timi2506)", destination: URL(string: "https://x.com/timi2506")!)
                    Link("Support Me", destination: URL(string: "https://timi2506.is-a.dev/donate/")!)
                }
            } .formStyle(GroupedFormStyle())
        }
    }
}
#Preview {
    ContentView()
}
