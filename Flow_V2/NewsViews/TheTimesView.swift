//
//  TheTimesView.swift
//  Flow_V2
//
//  Created by CTSS Students on 31/10/22.
//

import SwiftUI

struct TheTimesView: View {
    @StateObject var datas = TheTimesNewsCollector()
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
                                        .lineLimit(2)
                                    
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
                    .navigationTitle("The Times")
                    .environmentObject(datas)
                    .onAppear {
                        datas.getData()
                }
            }
        }
    }
}

struct TheTimesView_Previews: PreviewProvider {
    static var previews: some View {
        TheTimesView()
    }
}
