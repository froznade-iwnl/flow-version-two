//
//  CheckInView.swift
//  Flow_V2
//
//  Created by CTSS Students on 25/10/22.
//

import SwiftUI

struct CheckInButton: View {
    
    var textholder: String
    var color: Color
    var id: Int
    
    var body: some View {
        
        VStack{
            
            Button {
                print("button \(id)")
            } label: {
                VStack{
                    Image(systemName: "house")
                        .foregroundColor(.white)
                        .padding()
                    Text("\(textholder)")
                        .foregroundColor(.white)
                        .font(.body)
                        .font(.system(.body, design: .rounded))
                }
                .frame(width: 100, height: 150)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color)
                        .shadow(color: .gray.opacity(0.6), radius: 4, y: 4)
                )
            }
            .padding(2)
            
        }
        
    }
}

struct CheckInView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack {
                
                Text("How are you \nfeeling right now?")
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.green)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text("Pick an emoji!")
                    .italic()
                    .foregroundColor(.gray)
                    .padding(0.5)
                
                
                LazyVGrid(columns: columns) {
                    
                    CheckInButton(textholder: "Ecstatic", color: .yellow, id: 0)
                    CheckInButton(textholder: "Happy", color: .blue, id: 1)
                    CheckInButton(textholder: "Neutral", color: .green, id: 2)
                    CheckInButton(textholder: "Sad", color: .purple, id: 3)
                    CheckInButton(textholder: "Miserable", color: .cyan, id: 4)
                    CheckInButton(textholder: "Furious", color: .red, id: 5)
                    
                }
                
                .padding(.top, 20)
                
                
                
            }
            .padding(20)
            
        }
        
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}
