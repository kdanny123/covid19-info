//
//  CountyView.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/6/21.
//

import SwiftUI 

struct CountyView: View {
    var county: String //fips code passed
    var maxHeight: CGFloat = 200
    @State private var countySpecifics = [CountySpecificModel]()
    
    var body: some View {
        VStack {
            ForEach(countySpecifics, id: \.self) {spec in
                Text("\(spec.county)").font(.title).fontWeight(.bold)
                Spacer()
                Text("Population: \(spec.population)").foregroundColor(.orange)
                Text("Cases: \(spec.actuals.cases)").foregroundColor(.green)
                Text("Vaccinations Completed").foregroundColor(.blue)
                Text("Last Updated Date: \(spec.lastUpdatedDate)")
                VStack {
                    HStack(alignment: .bottom, spacing: 8) {
                        
                        Rectangle().fill(Color.orange).frame(width: UIScreen.main.bounds.width/4-50, height: maxHeight)
                        
                        Rectangle().fill(Color.green).frame(width: UIScreen.main.bounds.width/4-50, height: maxHeight*(CGFloat(spec.actuals.cases)/CGFloat(spec.population)))
                        VStack {
                            
                            Text(String(format: "%.2f", Double(spec.metrics.vaccinationsCompletedRatio*100))+"%")
                            
                            Rectangle().fill(Color.blue).frame(width: UIScreen.main.bounds.width/4-50, height:
                                                                maxHeight*(CGFloat(spec.metrics.vaccinationsCompletedRatio)))
                        }
                    }
                }
                Spacer()
            }
        }.onAppear {
            loadData(state: county)
        }
    }
    
    func loadData(state: String) {
        guard let url = URL(string: "https://api.covidactnow.org/v2/county/\(county).json?apiKey=YOUR_KEY_HERE") else {
            print("Invalid url...")
            return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(CountySpecificModel.self, from: data)
                DispatchQueue.main.async {
                    self.countySpecifics = [decodedData]
                }
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
}
