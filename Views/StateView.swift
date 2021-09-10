//
//  StateView.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/6/21.
//

import SwiftUI


struct StateView: View {
    @State private var county = [CountyModel]()
    var information: InfoModel
    var maxHeight: CGFloat = 200
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("State Population: \(information.population)").foregroundColor(.orange)
            Text("Cases: \(information.actuals.cases)").foregroundColor(.green)
            Text("Deaths: \(information.actuals.deaths)").foregroundColor(.red)
            Text("Vaccinations Administered: \(information.actuals.vaccinesAdministered)").foregroundColor(.purple)
            Text("Vaccinations Completed: \(information.actuals.vaccinationsCompleted)").foregroundColor(.blue)
            Text("Last Updated Date: \(information.lastUpdatedDate)")
        }
        .frame(height: UIScreen.main.bounds.height/6)
        .padding(.horizontal)
        //MARK: - Bar Cells
        VStack {
            
            HStack(alignment: .bottom, spacing: 8) {
                
                Rectangle().fill(Color.orange).frame(width: UIScreen.main.bounds.width/4-50, height: maxHeight) //max height = 1:1 population
                
                Rectangle().fill(Color.green).frame(width: UIScreen.main.bounds.width/5-12, height: maxHeight*(CGFloat(information.actuals.cases)/CGFloat(information.population)))
                VStack {
                    
                    Text(String(format: "%.2f", Double(Double(information.actuals.deaths)/Double(information.population)*100))+"%")
                    
                    Rectangle().fill(Color.red).frame(width: UIScreen.main.bounds.width/5-12, height: maxHeight*(CGFloat(information.actuals.deaths)/CGFloat(information.population)))
                }
                
                Rectangle().fill(Color.purple).frame(width: UIScreen.main.bounds.width/4-50, height:
                                                        maxHeight*(CGFloat(information.actuals.vaccinesAdministered)/CGFloat(information.population)))
                
                VStack {
                    Text(String(format: "%.2f", Double(information.metrics.vaccinationsCompletedRatio*100))+"%")
                    Rectangle().fill(Color.blue).frame(width: UIScreen.main.bounds.width/5-12, height: (maxHeight*CGFloat(information.metrics.vaccinationsCompletedRatio)))
                }
            }
        }
        
        
        //MARK:- Specific State Counties List
        
        VStack {
            List {
                ForEach(county, id: \.self) {county in
                    
                    ZStack {
                        Button("") {}//clear out greyed selection after returning previous screen 
                        NavigationLink(
                            destination: CountyView(county: county.fips),
                            label: {
                                Text("\(county.county)")
                            })
                    }
                }
            }
            .navigationTitle("\((StateImage().stateImage(state: information.state)).capitalizingFirstLetter())") .onAppear() {
                loadData(state: information.state)
            }
        }
    }
    
    
    func loadData(state: String) {
        guard let url = URL(string: "https://api.covidactnow.org/v2/county/\(state).json?apiKey=YOUR_KEY_HERE") else {
            print("Invalid url...")
            return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([CountyModel].self, from: data)
                self.county = (decodedData)
            } catch {
                print("error: \(error)")
            }
        }.resume()
    }
    
}


