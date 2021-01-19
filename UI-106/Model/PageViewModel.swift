//
//  PageViewModel.swift
//  UI-106
//
//  Created by にゃんにゃん丸 on 2021/01/19.
//

import SwiftUI

class PageViewModel: ObservableObject {
    @Published var selectedtab = "tab"
    
    @Published var urls = [
    
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!),
        Page(url: URL(string: "https://www.apple.com/jp/macbook-air/")!)
    ]
    
    @Published var currentpage : Page?
}

