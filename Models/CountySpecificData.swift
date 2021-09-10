//
//  CountySpecificData.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/8/21.
//

//import SwiftUI

//class CountySpecificData: ObservableObject {
//    var countyFips: String = "24003"
//    @Published var countySpecifics = [CountySpecificModel]()
//
//    init() {
//        loadData(state: countyFips)
//    }
//
//    func loadData(state: String) {
//        guard let url = URL(string: "https://api.covidactnow.org/v2/county/\(state).json?apiKey=YOUR_KEY_HERE") else {
//            print("Invalid url...")
//            return }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decodedData = try JSONDecoder().decode(CountySpecificModel.self, from: data)
//                DispatchQueue.main.async {
//                    self.countySpecifics = [decodedData]
//                    print(decodedData)
//                }
//
//
//
//            } catch {
//                print("error: \(error)")
//            }
//        }.resume()
//    }
//
//
//
//}

