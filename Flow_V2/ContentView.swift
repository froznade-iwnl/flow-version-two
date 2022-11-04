//
//  ContentView.swift
//  Flow_V2
//
//  Created by CTSS Students on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State public var tabViewSelection = 0
    @State var showChecksIn = false
    @State var haveEnteredName = false
    
    
    var body: some View {
        
        TabView(selection: $tabViewSelection){
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
                .tag(0)
               
            
            NewsUIView()
                .tabItem {
                    Label("Library", systemImage: "book")
                }.tag(1)
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
            
            SearchBarView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass.circle")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
                .tag(2)
            
            CreditView()
                .tabItem {
                    Label("about", systemImage: "info.circle")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.white, for: .tabBar)
                .tag(3)
            
        }
        .accentColor(.textColor)
        .onAppear() {
            showChecksIn = true
            haveEnteredName = true
        }
        .fullScreenCover(isPresented: $haveEnteredName) {
            LoginView()
        }
        .fullScreenCover(isPresented: $showChecksIn, onDismiss: {
            
        }) {
            CheckInView()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
