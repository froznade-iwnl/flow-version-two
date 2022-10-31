//
//  ContentView.swift
//  Flow_V2
//
//  Created by CTSS Students on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeScreenView(name: "Raditya")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
