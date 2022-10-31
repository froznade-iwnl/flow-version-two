//
//  NewsData.swift
//  Flow_V2
//
//  Created by CTSS Students on 25/10/22.
//

import Foundation

struct healthNews: Codable {
    var title: String
    var url: String
    var source: String
}

//forDNA
class DNANewsCollector: ObservableObject {
    
    @Published var newsData : [healthNews] = []
    
    func getData() {
        
        let url = URL(string: "https://mental-health-info-api.p.rapidapi.com/news/dna")!
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("4356d1995cmshcb3a848e79b4040p1adfa3jsn866463cb3957", forHTTPHeaderField: "X-RapidAPI-Key")
        urlRequest.setValue("mental-health-info-api.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        session.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    self.newsData = try! decoder.decode([healthNews].self, from: data)
                }
            }
        }.resume()
    }
}

//forTheTimes
class TheTimesNewsCollector: ObservableObject {
    
    @Published var newsData : [healthNews] = []
    
    func getData() {
        
        let url = URL(string: "https://mental-health-info-api.p.rapidapi.com/news/dna")!
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("4356d1995cmshcb3a848e79b4040p1adfa3jsn866463cb3957", forHTTPHeaderField: "X-RapidAPI-Key")
        urlRequest.setValue("mental-health-info-api.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        session.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    self.newsData = try! decoder.decode([healthNews].self, from: data)
                }
            }
        }.resume()
    }
}
