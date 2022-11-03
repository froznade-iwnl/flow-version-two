//
//  NewsUI.swift
//  Flow_V2
//
//  Created by CTSS Students on 30/10/22.
//

import SwiftUI
import CachedAsyncImage


struct NewsUIView: View {
    
    init(){
        UITableView.appearance().backgroundColor = .green
    }
    
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var sites = newsSites //Refer to SetupData File
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                List(sites) { news in
                    NavigationLink(destination: news.destination){
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                CachedAsyncImage(url: URL(string: news.imagelink), transaction: Transaction(animation: .easeInOut)){ phase in
                                    
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                    }else{
                                        HStack{
                                            ProgressView()
                                        }
                                    }
                                }
                            }
                            
                            Text(news.name)
                                .font(.headline)
                                .padding(.vertical)
                            
                            Text(news.description)
                                .font(.body)
                                .lineLimit(5)
                        }
                        
                        
                    }
                    .padding(.top, 20)
                    
                }
                
            }
            .navigationTitle("My Library 📚")
            .toolbarBackground(Color.textColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct NewsUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsUIView()
    }
}
