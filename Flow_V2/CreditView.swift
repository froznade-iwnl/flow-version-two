//
//  CreditView.swift
//  Flow_V2
//
//  Created by CTSS Students on 2/11/22.
//

import SwiftUI
import CachedAsyncImage

struct CreditView: View {
    
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                
                Text("FLOW")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.textColor)
                
                Text("Created by FLOW's Development Team")
                    .italic()
                
                Divider()
                
                Group{
                    Text("Programmer:")
                    Text("Raditya Aryo Wahyudi")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    Text("Design & Concept:")
                    Text("Tran Bao Ngoc & Magati S Kumar")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    Text("Documentation")
                    Text("Ashton, Heng Yu Hang")
                        .font(.headline)
                        .padding(.bottom, 10)
                }
                     
                
                Text("Data Sources")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.textColor)
                Divider()
                
                VStack {
                    CachedAsyncImage(url: URL(string: credit.logo), transaction: Transaction(animation: .easeInOut)){ phase in
                        
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .opacity(0.7)
                                
                        }else{
                            HStack{
                                ProgressView()
                            }
                        }
                    }
                }
                .frame(width: 200, height: 200)
                .offset(y: -75)
                .onTapGesture {
                    openURL(URL(string: credit.url)!)
                }
                
            }.padding(.horizontal, 20)
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
