//
//  DNAView.swift
//  Flow_V2
//
//  Created by CTSS Students on 31/10/22.
//

import SwiftUI

struct DNAView: View {
    @StateObject var datas = DNANewsCollector()
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        
        ZStack {
            
                VStack {
                    List {
                        ForEach(datas.newsData) { data in
                            HStack {
                                VStack(alignment: .leading){
                                    Text(data.title)
                                        .font(.body)
                                        .lineLimit(5)
                                    
                                    HStack {
                                        Text(data.source)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .italic()
                                        .padding(.top, 2)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }.onTapGesture {
                                    openURL(URL(string: data.url)!)
                                }
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.blue)
                                    .padding(.horizontal)
                            }
                            
                        }
                    }
                    .navigationTitle("DNA")
                    .environmentObject(datas)
                    .onAppear {
                        datas.getData()
                }
                }
                
            
        }
    }
}


struct DNAView_Previews: PreviewProvider {
    static var previews: some View {
        DNAView()
    }
}
