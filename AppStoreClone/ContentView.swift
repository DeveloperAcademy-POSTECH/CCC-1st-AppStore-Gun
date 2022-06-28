//
//  ContentView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Today Tab")
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Today")
                }
            Text("Game Tab")
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            AppView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("App")
                }
            Text("Aracade Tab")
                .tabItem {
                    Image(systemName: "externaldrive.connected.to.line.below.fill")
                    Text("Aracade")
                }
            Text("Search Tab")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
