//
//  DragViewDelegate.swift
//  UI-106
//
//  Created by にゃんにゃん丸 on 2021/01/19.
//

import SwiftUI

struct DragViewDelegate: DropDelegate {
    var page : Page
    var model : PageViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        model.currentpage = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        if model.currentpage == nil{
            
            return model.currentpage = page
        }
        
        
        let fromindex = model.urls.firstIndex { (page) -> Bool in
            return page.id == model.currentpage?.id
        } ?? 0
        
        let toindex = model.urls.firstIndex { (page) -> Bool in
            return page.id == self.page.id
        } ?? 0
        
        if fromindex != toindex{
            
            let frompage = model.urls[fromindex]
            model.urls[fromindex] = model.urls[toindex]
            model.urls[toindex] = frompage
            
            
        }

        
        
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}

