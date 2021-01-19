//
//  WebView.swift
//  UI-106
//
//  Created by にゃんにゃん丸 on 2021/01/19.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url : URL
    func makeUIView(context: Context) -> WKWebView {
        
        let view = WKWebView()
        view.isUserInteractionEnabled = false
        view.load(URLRequest(url: url))
        view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        
       
        
        
        return view
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}


