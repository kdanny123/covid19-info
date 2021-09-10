//
//  StateImage.swift
//  COVID19 Info
//
//  Created by Kun Lok on 9/7/21.
//

import SwiftUI

struct StateImage: View {
    var state: String?
    
    var body: some View {
        Image(stateImage(state: state!)).resizable()
    }
    
    func stateImage(state: String) -> String {
        
        switch (state){
        case "AL":
            return ("alabama")
        case "AK":
            return ("alaska")
        case "AR":
            return ("arkansas")
        case "AZ":
            return ("arizona")
        case "CA":
            return ("california")
        case "CO":
            return ("colorado")
        case "CT":
            return ("connecticut")
        case "DC":
            return ("D.C.")
        case "DE":
            return ("delaware")
        case "FL":
            return ("florida")
        case "GA":
            return ("georgia")
        case "HI":
            return ("hawaii")
        case "ID":
            return ("idaho")
        case "IL":
            return ("illinois")
        case "IN":
            return ("indiana")
        case "IA":
            return ("iowa")
        case "KS":
            return ("kansas")
        case "PR":
            return ("puerto_Rico")
        case "KY":
            return ("kentucky")
        case "LA":
            return ("louisiana")
        case "ME":
            return ("maine")
        case "MD":
            return ("maryland")
        case "MA":
            return ("massachusetts")
        case "MI":
            return ("michigan")
        case "MN":
            return ("minnesota")
        case "MS":
            return ("mississippi")
        case "MO":
            return ("missouri")
        case "MP":
            return ("mp")
        case "MT":
            return ("montana")
        case "NE":
            return ("nebraska")
        case "NV":
            return ("nevada")
        case "NH":
            return ("new_Hampshire")
        case "NJ":
            return ("new_Jersey")
        case "NM":
            return ("new_Mexico")
        case "NY":
            return ("new_York")
        case "NC":
            return ("north_Carolina")
        case "ND":
            return ("north_Dakota")
        case "OH":
            return ("ohio")
        case "OK":
            return ("oklahoma")
        case "OR":
            return ("oregon")
        case "PA":
            return ("pennsylvania")
        case "RI":
            return ("rhode_Island")
        case "SC":
            return ("south_Carolina")
        case "SD":
            return ("south_Dakota")
        case "TN":
            return ("tennessee")
        case "TX":
            return ("texas")
        case "UT":
            return ("utah")
        case "VT":
            return ("vermont")
        case "VA":
            return ("virginia")
        case "WA":
            return ("washington")
        case "WV":
            return ("west_Virginia")
        case "WI":
            return ("wisconsin")
        case "WY":
            return ("wyoming")
        default:
            return "xmark.octagon"
        }
    }
}

struct StateImage_Previews: PreviewProvider {
    static var previews: some View {
        StateImage()
    }
}
