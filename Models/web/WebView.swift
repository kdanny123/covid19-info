//
//  WebView.swift
//  COVID19 Info
//
//  Created by Kun Lok on 8/7/21.
//

import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    var url: String
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        let wkWebView = WKWebView()
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let htmlUrl = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: htmlUrl)
        
        wkWebView.load(request)
        wkWebView.isUserInteractionEnabled = false //disable innate scroll view - main map statistics display is of interest
        
        return wkWebView
    }
}
