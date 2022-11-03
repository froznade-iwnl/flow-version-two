//
//  SearchBarData.swift
//  Flow_V2
//
//  Created by CTSS Students on 1/11/22.
//

import Foundation
import SwiftUI

struct newsData: Codable, Identifiable {
    
    let id = UUID()
    var hasPart: [Datas]
}

struct Datas: Codable, Identifiable {
    let id = UUID()
    var description: String
    var url: String
    var headline: String
}
    


class MentalHealthGrabber: ObservableObject {
    
    var allNews: [Datas] = []
    @Published var dataset: newsData?
    @Published var searchedResults: [Datas] = []
    
    func getData() {
        let url = URL(string: "https://api.nhs.uk/mental-health/conditions")!
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        
        dataset = nil
        
        urlRequest.setValue("c3eab1cd53d049839564b988c6d3d783", forHTTPHeaderField: "subscription-key")
        
        session.dataTask(with: urlRequest) { data, response, error in
            if let data = data {
//                print(response)
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    let jsondata = try! decoder.decode(newsData.self, from: data)
                    self.allNews = jsondata.hasPart
                    self.searchedResults = self.allNews
//                    print(self.last)
                }
            }
        }.resume()
    }
}
