//
//  ContentView.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/5/21.
//

import SwiftUI



struct HomeView: View {
    @ObservedObject var state = InfoStateViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Webview(url: "index.html")
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 450)
                    List {
                        ForEach(state.info, id: \.self) {x in
                            
                            ZStack {
                                Button("") {}//clear out greyed selection after returning previous screen
                                
                                NavigationLink(
                                    
                                    destination: StateView(information: x),
                                    label: {
                                        StateImage(state: x.state)
                                            .frame(width: 100, height: 100)
                                            .scaledToFit()
                                            .padding(.leading)
                                        Text("\(StateImage().stateImage(state: x.state)) (\(x.state))".capitalizingFirstLetter().replacingOccurrences(of: "_", with: " "))
                                    })
                            }
                        }
                    }
                    .navigationTitle("COVID-19 Data")
                    .padding()
                }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
