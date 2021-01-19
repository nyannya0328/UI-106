//
//  Home.swift
//  UI-106
//
//  Created by にゃんにゃん丸 on 2021/01/19.
//


import SwiftUI

let gradient = LinearGradient(gradient: .init(colors: [Color.orange.opacity(1),Color.red.opacity(1)]), startPoint: .leading, endPoint: .trailing)

struct Home: View {
    
    @StateObject var model = PageViewModel()
    @Namespace var animation
    
    var columns = Array(repeating: GridItem(.flexible(),spacing:10), count: 2)
    var body: some View {
        VStack{
            
            HStack(spacing:15){
                
                Image(systemName: "face.smiling.fill")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 85, height: 50)
                    .foregroundColor(model.selectedtab == "tab" ? Color.black : Color.white)
                    .background(
                        ZStack{
                            
                            
                            if model.selectedtab != "tab"{
                                
                                Color.clear
                            }
                            else{
                                
                                
                                Color.white
                                    .cornerRadius(10)
                                    .matchedGeometryEffect(id: "tab", in: animation)
                            }
                        }
                    
                    )
                    .onTapGesture {
                        withAnimation{
                            
                            model.selectedtab = "tab"
                        }
                    }
                
                Text("S")
                    .font(.system(size: 40, weight: .bold))
                    .frame(width: 40, height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(model.selectedtab == "smile" ? Color.black : Color.white,lineWidth: 2))
                    .foregroundColor(model.selectedtab == "smile" ? Color.black : Color.white)
                    .background( ZStack{
                        
                        
                        if model.selectedtab != "smile"{
                            
                            Color.clear
                        }
                        else{
                            
                            
                            Color.white
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                    })
                    .onTapGesture {
                        withAnimation{
                            
                            model.selectedtab = "smile"
                        }
                    }
                
                Image(systemName: "face.dashed.fill")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 85, height: 50)
                    .foregroundColor(model.selectedtab == "face" ? Color.black : Color.white)
                    .background( ZStack{
                        
                        
                        if model.selectedtab != "face"{
                            
                            Color.clear
                        }
                        else{
                            
                            
                            Color.white
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                    })
                    .onTapGesture {
                        withAnimation{
                            
                            model.selectedtab = "face"
                        }
                    }
                
                
                
                
                
                
                
            }
            .background(Color.white.opacity(0.2))
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 15)
            .cornerRadius(10)
            .padding(.top)
           
           
            
            ScrollView{
                
                LazyVGrid(columns: columns, content: {
                    
                    ForEach(model.urls){page in
                        
                        WebView(url: page.url)
                            .opacity(model.currentpage?.id == page.id ? 0.03 : 1)
                            .frame(height:250)
                            .onDrag{
                                
                                return NSItemProvider(contentsOf: URL(string: "\(page.id)")!)!
                            }
                            .onDrop(of: [.url], delegate: DragViewDelegate(page: page, model: model))
                            
                        
                        
                        
                    }
                    .padding()
                    
                    
                    
                    
                })
                
            }
            
            
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(gradient.ignoresSafeArea(.all, edges: .all))
    }
}

