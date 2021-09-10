//
//  InfoViewModel.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/6/21.
//

//import Foundation
import SwiftUI


class InfoStateViewModel: ObservableObject {
    @Published var info = [InfoModel]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = URL(string: "https://api.covidactnow.org/v2/states.json?apiKey=YOUR_KEY_HERE") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode([InfoModel].self, from: data)
                DispatchQueue.main.async {
                    self.info = (decodedData)
                }
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
}
