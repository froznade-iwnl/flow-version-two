//
//  TheGuardianView.swift
//  Flow_V2
//
//  Created by CTSS Students on 31/10/22.
//

import SwiftUI

struct TheGuardianView: View {
    
    @StateObject var datas = TheGuardianNewsCollector()
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
                                        Text("theguardian")
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
                    .navigationTitle("The Guardian")
                    .environmentObject(datas)
                    .onAppear {
                        datas.getData()
                }
            }
        }
    }
}

struct TheGuardianView_Previews: PreviewProvider {
    static var previews: some View {
        TheGuardianView()
    }
}
