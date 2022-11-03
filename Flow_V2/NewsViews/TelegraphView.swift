//
//  TelegraphView.swift
//  Flow_V2
//
//  Created by CTSS Students on 31/10/22.
//

import SwiftUI

struct TelegraphView: View {
    
    @StateObject var datas = TelegraphNewsCollector()
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
                    .navigationTitle("Telegraph")
                    .environmentObject(datas)
                    .onAppear {
                        datas.getData()
                }
            }
        }
    }
}

struct TelegraphView_Previews: PreviewProvider {
    static var previews: some View {
        TelegraphView()
    }
}
