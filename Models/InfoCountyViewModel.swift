//
//  InfoCountyViewModel.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/6/21.
//
//
//
import SwiftUI

class InfoCountyViewModel: ObservableObject {
    @Published var countyInfo = [CountyModel]()
    public var state = "AK"
    
    init() {
        loadData(state: state)
    }
    
    func loadData(state: String) {
        guard let url = URL(string: "https://api.covidactnow.org/v2/county/\(state).json?apiKey=YOUR_KEy_HERE") else {
            print("Invalid url...")
            return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([CountyModel].self, from: data)
                print(decodedData)
                self.countyInfo = (decodedData)
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
}
