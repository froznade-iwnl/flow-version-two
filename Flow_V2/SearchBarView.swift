//
//  SearchBarView.swift
//  Flow_V2
//
//  Created by CTSS Students on 1/11/22.
//

import SwiftUI
import CachedAsyncImage

struct SearchBarView: View {
    
    @StateObject var oo = MentalHealthGrabber()
    @State private var searchedNews = ""
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        
        NavigationView {
            VStack{
                
                Spacer()
                
                Text("Find a Topic")
                    .font(.title).bold()
                Text("Start searching about a mental health topic that you want to know!")
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                Spacer()

                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.gray)
            .padding()
            .navigationTitle("What's up?")
            .toolbarBackground(Color.textColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .searchable(text: $searchedNews) {
            
                ForEach(oo.searchedResults) { news in
                        HStack {
                            VStack(alignment: .leading){
                                Text(news.headline)
                                    .font(.headline)
                                    .lineLimit(5)
                                
                                HStack {
                                    Text(news.description)
                                        .font(.body)
                                        .padding(.top, 2)
                                    
                                    Spacer()
                                    
                                }
                                
                            }.onTapGesture {
                                openURL(URL(string: news.url)!)
                            }
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                        }
                }
            
        }
        .onChange(of: searchedNews) { searchedNews in
            oo.searchedResults = oo.allNews.filter({ news in
                news.description.lowercased().contains(searchedNews.lowercased()) || news.headline.lowercased().contains(searchedNews.lowercased())
            })
        }
        .onAppear {
            oo.getData()
        }
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
