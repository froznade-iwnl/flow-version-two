//
//  HomeScreenView.swift
//  Flow_V2
//
//  Created by CTSS Students on 28/10/22.
//

import SwiftUI

struct HomeScreenView: View {
    var name: String
    
    var body: some View {
        ZStack {
            Color.bgColor
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack{
                    
                    HStack {
                        
                        Text("Hi, \(name)")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.textColor)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                            
                    HStack {
                        
                        Text("Welcome Back")
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .foregroundColor(.textColor)
                        
                        Spacer()
                    }
                        
                        
                        
                    
                    Text("You are feeling")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.textColor)
                    
                    
                    Image(systemName: "circle.fill")
                        .font(.system(size: 90))
                        .foregroundColor(.yellow)
                    
                    Text("Your weekly emotional status data")
                        .padding()
                        .font(.headline)
                        .bold()
                        .foregroundColor(.textColor)
                    
                    
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 241)
                        .foregroundColor(.white)
                    
                    
                        
                    
                    
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(name: "TestPlayer")
    }
}
