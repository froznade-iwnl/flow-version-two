//
//  HomeScreenView.swift
//  Flow_V2
//
//  Created by CTSS Students on 28/10/22.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject var quote = QuoteGrab()
    
    var body: some View {
        ZStack {
            Color.bgColor
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading){
                    
                    HStack {
                        
                        Text("Hi, \((User.username == "" ? "User" : User.username))!")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.textColor)
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                            
                    HStack {
                        
                        Text("Welcome Back")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.textColor)
                        
                        Spacer()
                    }
                        
                        
                        
                    
                    HStack {
                        VStack {
                            Text("You are feeling")
                                .bold()
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(.textColor)
                            
                            if let lastElement = EmotionManager().emotions.last {
                                
                                Image(lastElement.image)
                                    .resizable()
                                    .scaledToFit()
                                
                            } else {
                                ProgressView()
                            }
                            
                        }
                        .padding()
                        .frame(maxHeight: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.white)
                            
                        }
                        
                        
                        
                        VStack(alignment: .leading){
                            
                            ForEach(quote.todayQuote) { quotes in
                                Text("\"\(quotes.q)\"")
                                    .italic()
                                
                                
                                Text("- \(quotes.a)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(2)
                            }
                            .padding(.horizontal)
                            
                            
                        }
                        .padding(.top)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.vertical, 20)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxHeight: 200)
                    
                    
                    
                    HStack {
                        Spacer()
                        Text("Your weekly emotional status data")
                            .padding(.vertical)
                            .font(.system(.title3, design: .rounded))
                            .bold()
                            .foregroundColor(.textColor)
                        Spacer()
                    }
                    .padding(.top, 20)
                        
                    
                    ChartView()
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.white)
                        }
    
                }
                .padding(.horizontal, 20)
            }
        }
        .onAppear{
            quote.getQuote()
        }
        .refreshable {
            quote.getQuote()
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
