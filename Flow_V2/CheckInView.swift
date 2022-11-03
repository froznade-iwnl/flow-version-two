//
//  CheckInView.swift
//  Flow_V2
//
//  Created by CTSS Students on 25/10/22.
//

import SwiftUI

struct CheckInButton: View {
    
    @Environment(\.dismiss) var dismiss
    var image: String
    var color: Color
    var id: Int
    @AppStorage("ct") var daysCount = 0
    
    @StateObject var emotionData = EmotionManager()
    
    var body: some View {
        
        VStack{
            
            Button {
                print("button \(id)")
                emotionData.emotions.append(emotion(id: daysCount, image: image.lowercased(), emotionID: id))
                daysCount += 1
                print(emotionData.emotions)
                dismiss()
            } label: {
                VStack{
                    Image(image.lowercased())
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                .frame(width: 115, height: 115)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(color.opacity(0.6))
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
                    .foregroundColor(Color.textColor)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text("Pick an emoji!")
                    .italic()
                    .foregroundColor(.gray)
                    .padding(0.5)
                
                
                LazyVGrid(columns: columns) {
                    
                    CheckInButton(image: "Ecstatic", color: .yellow, id: 5)
                    CheckInButton(image: "Happy", color: .green, id: 4)
                    CheckInButton(image: "Neutral", color: .mint, id: 3)
                    CheckInButton(image: "Sad", color: .teal, id: 2)
                    CheckInButton(image: "Miserable", color: .purple, id: 1)
                    CheckInButton(image: "Furious", color: .red, id: 0)
                    
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
